import { RandomUtil } from "@pura/harmony-utils";
import { HeaderBack } from "../common/GenreInterface";
import { stack } from "../common/ShareStorage";
@Component
export default struct PageHeader{
  @Prop title:string;
  @Prop left:boolean = true;
  @BuilderParam right: () => void = this.base;
  @Builder base() {
    Blank()
      .width(28);
  }
  @StorageProp("system") system: number = 0;

  build() {
    Row() {
      Column() {
        if(this.left) {
          Image($r("app.media.ic_back"))
            .width(28)
            .onClick(() => {
              const result:HeaderBack = {
                back: true,
                id: RandomUtil.generateUUID36(),
              };
              stack.pop(result);
            });
        }
      }
      .width(40)
      .alignItems(HorizontalAlign.Start);

      Text(this.title)
        .font({size: 18,weight: FontWeight.Bold});
      Column() {
        this.right();
      }
      .width(40);
    }
    .margin({top: this.system + "px"})
    .padding(16)
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween);
  }
}