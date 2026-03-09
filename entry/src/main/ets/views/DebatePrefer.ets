import { Card } from "../utils/Patterns";
import PageHeader from "../component/PageHeader";
import { LiveDiscovery } from "../common/Mock";
import Animations from "../utils/Animation";
import LoadingImage from "../component/LoadingImage";

@Builder
export function Factory() {
  DebatePrefer();
}
@Component
struct DebatePrefer {
  @State discovery?: LiveDiscovery = undefined;
  @State row: number = 0

  build() {
    NavDestination() {
      Column({space: 8}) {
        PageHeader({ title: "观点倾向"});

        if(this.discovery) {
          Scroll() {
            Column() {
              LoadingImage({
                url:this.discovery.image
              });
              Column({space: 8}) {
                Column() {
                  Text(this.discovery.title)
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .fontColor("#333")
                    .fontColor(Color.White)
                    .height(28);
                }
                .attributeModifier(new Card(8,4))
                .alignItems(HorizontalAlign.Start);

                Divider()
                  .strokeWidth(1)
                  .color($r("app.color.opacity"))
                  .width("100%");

                Text(this.discovery.content)
                  .fontSize(12)
                  .fontColor("#666")
                  .textIndent(24)
                  .margin({bottom: 16,top: 16})
                  .lineHeight(24);
              }
              .width("100%")
              .padding(8)
              .padding(16)
              .alignItems(HorizontalAlign.Start);
            }
          }
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
          .width("100%")
          .align(Alignment.Top)
          .layoutWeight(1);

          Column() {
            if(this.discovery.status) {
              Row() {
                Stack() {
                  Text(this.discovery.oppose.toString())
                    .fontSize(14)
                    .fontColor(Color.White)
                    .fontWeight(FontWeight.Bold);
                }
                .layoutWeight(this.discovery.oppose)
                .height("100%")
                .linearGradient({
                  angle: 90,
                  colors: [["#FF5E5E", 0.0], ["#FF9595", 1.0]]
                });

                Stack() {
                  Text(this.discovery.agree.toString())
                    .fontSize(14)
                    .fontColor(Color.White)
                    .fontWeight(FontWeight.Bold);
                }
                .layoutWeight(this.discovery.agree)
                .height("100%")
                .linearGradient({
                  angle: 90,
                  colors: [["#8DBAFF", 0.0], ["#4A90E2", 1.0]]
                });
              }
              .width("100%")
              .height(44)
              .borderRadius("50%")
              .clip(true);
            } else {
              Row() {
                Stack() {
                  Polygon()
                    .points([[0, 0], [this.row, 0], [this.row * 0.85, 44], [0, 44]])
                    .fill($r("app.color.red"))
                    .width("100%")
                    .margin({left: 8})
                    .height(44);

                  Text("反 对")
                    .font({
                      weight: FontWeight.Bold,
                      size: 16
                    })
                    .fontColor(Color.White);
                }
                .layoutWeight(1)
                .onAreaChange((_ov: Area, nv: Area) => {
                  this.row = nv.width as number
                })
                .onClick(() => {
                  this.getUIContext().animateTo(Animations.slideInFromLeft(), () => {
                    if(this.discovery) {
                      this.discovery.oppose++;
                      this.discovery.status = 1;
                    }
                  });
                });

                Stack() {
                  Polygon()
                    .points([[this.row * 0.15, 0], [this.row, 0], [this.row, 44], [0, 44]])
                    .fill($r("app.color.blue"))
                    .width("100%")
                    .margin({right: 8})
                    .height(44);

                  Text("赞 同")
                    .font({
                      weight: FontWeight.Bold,
                      size: 16
                    })
                    .fontColor(Color.White);
                }
                .layoutWeight(1)
                .onClick(() => {
                  this.getUIContext().animateTo(Animations.slideInFromLeft(), () => {
                    if(this.discovery) {
                      this.discovery.agree++;
                      this.discovery.status = 1;
                    }
                  });
                });
              }
              .width("100%")
              .borderRadius(12)
              .clip(true);
            }
          }
          .padding(16);
        }
      }
    }
    .hideTitleBar(true)
    .onReady((context:NavDestinationContext) => {
      this.discovery = context.pathInfo.param as LiveDiscovery;
    });
  }
}