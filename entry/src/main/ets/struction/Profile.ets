import { LinkUse, LinkData } from "../common/DataList";
import { stack } from "../common/ShareStorage";
import { WebH5Type } from '../common/GenreInterface'

@Component
export default struct Home {
  @StorageProp("system") system: number = 0;
  build() {
    Scroll() {
      Column({space: 8}) {
        Column() {
          Row() {
            Row({space: 16}) {
              Image($r("app.media.head"))
                .width(64)
                .height(64)
                .borderRadius(8)
                .objectFit(ImageFit.Cover);
              Column({space: 16}) {
                Column() {
                  Text("吃饱就睡")
                    .font({size: 18,weight: FontWeight.Bold});

                  Text("ID：1093847594")
                    .fontSize(14)
                    .fontColor($r("app.color.tint"))
                    .textAlign(TextAlign.Start);
                }
                .height(64)
                .justifyContent(FlexAlign.SpaceAround)
                .alignItems(HorizontalAlign.Start)

                Text("每日状态：美滋滋")
                  .fontSize(14)
                  .fontColor($r("app.color.tint"))
                  .textAlign(TextAlign.Start);
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

            }
            .alignItems(VerticalAlign.Top)
            .padding({left: 16,right: 16,top:32,bottom: 32})
            .margin({top: this.system + "px"})
          }
          .backgroundColor($r("app.color.purity"))
          .width("100%");
          Divider()
            .color($r("app.color.opacity"))
            .width("100%");
        }

        Column() {
          Divider()
            .color($r("app.color.opacity"))
            .width("100%");
          ForEach(LinkData,(item:LinkUse,index:number) => {
            Column() {
              Row({space: 8}) {
                Image(item.icon)
                  .width(24);
                Text(item.title)
                  .fontSize(14);
                Blank()
                  .layoutWeight(1);
                if(item.name) {
                  Image($r("app.media.ic_next"))
                    .width(24);
                }
              }
            }
            .width("100%")
            .padding(16)
            .alignItems(HorizontalAlign.Start)
            .onClick(() => {
              if(item.name) {
                const param: WebH5Type = {
                  title: item.title,
                  url: item.url || ""
                };
                stack.pushPath({
                  name: item.name,
                  param,
                });
              } else {
                try {
                  this.getUIContext().getPromptAction().showToast({
                    message: "当前是最新版本！",
                    duration: 2000,
                    bottom: 80
                  });
                } catch (error) {
                }
              }
            });
            if(index - LinkData.length + 1) {
              Divider()
                .color($r("app.color.shallow"))
                .margin({ left: 16, right: 16 })
            }
          });
          Divider()
            .color($r("app.color.opacity"))
            .width("100%");
        }
        .backgroundColor($r("app.color.purity"));

        Column() {
          Divider()
            .color($r("app.color.opacity"))
            .width("100%");
          Column() {
            Row({space: 8}) {
              Image($r("app.media.ic_setting"))
                .width(24);
              Text("设置")
                .fontSize(14);
              Blank()
                .layoutWeight(1);
              Image($r("app.media.ic_next"))
                .width(24);
            }
          }
          .width("100%")
          .padding(16)
          .alignItems(HorizontalAlign.Start)
          .backgroundColor($r("app.color.purity"));

          Divider()
            .color($r("app.color.opacity"))
            .width("100%");
        }
      }
      .width("100%")
      .height("100%");
    }
    .scrollBar(BarState.Off);
  }
}