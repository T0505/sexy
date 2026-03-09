import { KeyCode } from "@kit.InputKit";
import { Card } from "../utils/Patterns";
import DateUtil from "../utils/DateUtil";
import PageHeader from "../component/PageHeader";
import { common } from "@kit.AbilityKit";
import { Daily, DailyRecord, DiaryParam, findById, reconstruct } from "../common/GenreInterface";
import { util } from "@kit.ArkTS";
import { get, save } from "../utils/DatabaseUtil";
import { stack } from "../common/ShareStorage";

@Builder
export function Factory() {
  Diary();
}

@Component
struct Diary {
  @State count: number = 160;
  @State column: number = 10;
  @State ratio: number = 40;
  @State data: string[] = [];
  @State items: number[] = [];
  @State title:string = "";

  @State folderId: string = "";
  @State editingId: string = "";
  private scroller: Scroller = new Scroller();
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;

  aboutToAppear(): void {
    this.data = new Array(this.count).fill("");
    this.items = new Array<number>(this.count).fill(0).map((_: number, i: number): number => i);
  }

  expand() {
    const currentLen = this.items.length;
    let newData: string[] = [];
    let newItems: number[] = [];
    for (let i = 0; i < this.ratio; i++) {
      newData.push("");
      newItems.push(currentLen + i);
    }
    this.data = [...this.data, ...newData];
    this.items = [...this.items, ...newItems];
  }
  @Builder
  save() {
    Image($r("app.media.ic_complete"))
      .width(24)
      .height(24)
      .onClick(async () => {
      if (!this.title.trim()) {
        try {
          this.getUIContext().getPromptAction().showToast({ message: "请输入标题" });
        } catch (error) {}
        return;
      }

      const raw = await get<Daily>(this.context, "root");
      if (!raw) return;
      const root = reconstruct(raw);

      const targetFolder = this.folderId ? findById(root, this.folderId) : root;
      if (!targetFolder) return;

      if (this.editingId) {
        const index = targetFolder.children.findIndex(item => item.id === this.editingId);
        if (index !== -1) {
          targetFolder.children[index].title = this.title;
          targetFolder.children[index].content = [...this.data];
          targetFolder.children[index].write_time = new Date();
        }
      } else {
        const newRecord = new DailyRecord(
          util.generateRandomUUID(true),
          this.title,
          [...this.data]
        );
        targetFolder.children.push(newRecord);
      }

      await save(this.context, "root", root);
      stack.pop();
    });
  };
  build() {
    NavDestination() {
      Column() {
        PageHeader({title:"日记本",right: () => {
          this.save();
        }})

        Column({ space: 16 }) {
          Row() {
            Text("标题：");
            TextInput({ text: this.title })
              .backgroundColor(Color.Transparent)
              .border({ width: { bottom: 1 } })
              .layoutWeight(1).borderRadius(0).padding(0)
              .onChange((value: string) => {
                this.title = value;
              });
          }
          .width("100%")
          .margin({ top: 8, bottom: 8 });

          Grid(this.scroller) {
            ForEach(this.items, (index: number) => {
              GridItem() {
                TextInput({ text: this.data[index] })
                  .backgroundColor(Color.Transparent)
                  .width("100%").height("100%").fontSize(16)
                  .textAlign(TextAlign.Center).padding(0)
                  .id(index.toString())
                  .maxLength(1)
                  .onChange((value: string) => {
                    this.data[index] = value;
                    if (value.length >= 1) {
                      let next = index + 1;
                      if (next >= this.items.length - this.ratio) {
                        this.expand();
                      }
                      focusControl.requestFocus(next.toString());
                      this.scroller.scrollToIndex(next+this.ratio, true, ScrollAlign.END);
                    }
                  })
                  .onKeyEvent((event: KeyEvent) => {
                    if (event.type === KeyType.Down && event.keyCode === KeyCode.KEYCODE_DEL) {
                      if (this.data[index] === '' && index > 0) {
                        focusControl.requestFocus((index - 1).toString());
                        this.scroller.scrollToIndex(index - 1, true, ScrollAlign.START);
                      }
                    }
                  })
              }
              .aspectRatio(1)
              .border({
                width: {
                  bottom: 1,
                  left: index % this.column ? 1 : 0,
                  top: index >= this.column ? 1 : 0,
                },
                color: Color.Gray,
              });
            }, (item: number) => item.toString());
          }
          .columnsTemplate("1fr ".repeat(this.column).trimEnd())
          .columnsGap(0)
          .rowsGap(4)
          .width("100%")
          .layoutWeight(1)
          .border({ width: 1, color: Color.Gray })
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring);

          Row() {
            Text("时间：" + DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"))
              .fontSize(12).fontColor(Color.Grey);
            Text("字数：" + this.data.filter(v => v).length)
              .fontSize(12).fontColor(Color.Grey);
          }
          .width("100%")
          .justifyContent(FlexAlign.SpaceBetween);
        }
        .attributeModifier(new Card(8))
        .layoutWeight(1);
      }
      .width("100%")
      .padding(8)
      .height("100%");
    }
    .hideTitleBar(true)
    .onReady(async (context: NavDestinationContext) => {
      const params = context.pathInfo.param as DiaryParam;

      if (params) {
        this.folderId = params.folderId; // get folder ID

        if (params.record) {
          const r = params.record;
          this.title = r.title;
          this.data = [...r.content];
          this.editingId = r.id;
        }
      }
    });
  }
}