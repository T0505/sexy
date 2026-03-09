import PageHeader from "../component/PageHeader";
import { Card } from "../utils/Patterns";
import { get,save } from "../utils/DatabaseUtil";
import { common } from "@kit.AbilityKit";
import { Daily, DailyRecord, DiaryParam, findById, reconstruct } from "../common/GenreInterface";
import { util } from '@kit.ArkTS';
import FormPopup from "../utils/FormPopup";
import { stack } from "../common/ShareStorage";
import { GridCellItem } from "../component/GridCellItem";

@Builder
export function Factory() {
  DiaryBag();
}

@Component
struct DiaryBag {
  @State fullTree: Daily | null = null;
  @State currentFolder: Daily | null = null;
  @State currentId: string | null = null;
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;

  private controller: CustomDialogController | null = new CustomDialogController({
    builder: FormPopup({
      title: "新建文件夹",
      map: new Map([["文件名", ""]]),
      onCancel: () => {
        this.controller!.close();
      },
      onConfirm: (map: Map<string, string>) => {
        this.confirmCreate(map);
      }
    }),
    customStyle: true,
  });

  async refreshData() {
    const raw = await get<Daily>(this.context, "root");
    if (raw) {
      this.fullTree = reconstruct(raw);
      if (!this.currentId || this.currentId === this.fullTree.id) {
        this.currentFolder = this.fullTree;
      } else {
        this.currentFolder = findById(this.fullTree, this.currentId);
      }
    }
  }
  async confirmCreate(map: Map<string, string>) {
    const name = map.get("文件名");
    if (!name) return;

    if (this.currentFolder && this.fullTree) {
      const newDaily = new Daily(util.generateRandomUUID(true), name, new Date(), []);

      this.currentFolder.dailies.push(newDaily);

      this.currentFolder.dailies = [...this.currentFolder.dailies];

      save(this.context, "root", this.fullTree);

      this.controller!.close();
      map.set("文件名", "");
    }
  }

  @Builder create() {
    Text("新建").onClick(() => this.controller?.open())
  }

  build() {
    NavDestination() {
      Column() {
        PageHeader({
          title: (this.currentFolder && this.currentFolder.name !== 'root') ? this.currentFolder.name : "日记录",
          right: () => { this.create(); }
        });
        Column() {
          Grid() {
            ForEach(this.currentFolder?.dailies, (item: Daily) => {
              GridCellItem({
                title: item.name,
                icon: (item.children.length + item.dailies.length > 0) ? $r("app.media.ic_folder_have") : $r("app.media.ic_folder_empty"),
                canDelete: item.name !== "默认文件夹",
                onCallback: () => stack.pushPath({ name: "DiaryBag", param: item.id }),
                onDelete: () => {
                  this.currentFolder!.dailies = this.currentFolder!.dailies.filter(i => i.id !== item.id);
                  save(this.context, "root", this.fullTree!);
                }
              })
            }, (item: Daily) => item.id);
            ForEach(this.currentFolder?.children, (item:DailyRecord) => {
              GridCellItem({
                title: item.title,
                icon: $r("app.media.ic_document"),
                onCallback: () => stack.pushPath({ name: "Diary", param: { record: item, folderId: this.currentId } as DiaryParam }),
                onDelete: () => {
                  this.currentFolder!.children = this.currentFolder!.children.filter(i => i.id !== item.id);
                  save(this.context, "root", this.fullTree!);
                }
              })
            }, (item: DailyRecord) => item.id + item.write_time.getTime().toString());

            GridItem() {
              Image($r("app.media.ic_writing_create")).width(48);
            }
            .aspectRatio(1).backgroundColor($r("app.color.purity")).borderRadius(8)
            .onClick(() => {
              const param: DiaryParam = {
                folderId: this.currentId!
              };
              stack.pushPath({ name: "Diary", param})
            });
          }
          .columnsGap(8)
          .rowsGap(8)
          .columnsTemplate("1fr 1fr 1fr")
          .width("100%")
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring);
        }
        .attributeModifier(new Card(8)).layoutWeight(1);
      }
      .padding(8).width("100%").height("100%");
    }
    .hideTitleBar(true)
    .onShown(() => {
      this.refreshData();
    })
    .onReady(async (context: NavDestinationContext) => {
      const targetId = context.pathInfo.param as string;

      const raw = await get<Daily>(this.context, "root");
      if (raw) {
        this.fullTree = reconstruct(raw);
      } else {
        this.fullTree = new Daily(util.generateRandomUUID(true), "root", new Date(), [],
          [new Daily(util.generateRandomUUID(true), "默认文件夹", new Date())]
        );
        save(this.context, "root", this.fullTree);
      }
      if (!targetId) {
        this.currentFolder = this.fullTree;
        this.currentId = this.fullTree?.id || "";
      } else {
        this.currentFolder = findById(this.fullTree, targetId);
        this.currentId = targetId;
      }
    });
  }
}