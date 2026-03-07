import PageHeader from "../component/PageHeader";
import { LiveDiscovery, WaterFlowDataSource,liveDiscoveryDate } from "../common/Mock";
import { stack } from "../common/ShareStorage";

@Component
export default struct Live {

  private source = new WaterFlowDataSource();
  private scroller: Scroller = new Scroller();
  @State loading: boolean = false;
  aboutToAppear() {
    this.init(20);
  }

  init(count:number) {
    let array: LiveDiscovery[] = [];
    for (let i = 0; i < count && this.source.totalCount() + i < liveDiscoveryDate.length; i++) {
      array.push(liveDiscoveryDate[this.source.totalCount()+i]);
    }
    this.source.addData(array);
  }

  @Builder
  footer() {
    Column() {
      if (this.loading) {
        Row({ space: 8 }) {
          LoadingProgress()
            .width(24)
            .height(24)
            .color($r("app.color.main"))
          Text("加载更多中...")
            .fontSize(12)
            .fontColor($r("app.color.main"))
        }
        .width("100%")
        .justifyContent(FlexAlign.Center)
        .padding(15)
      } else {
        Text("已经到底啦~")
          .fontSize(14)
          .fontColor($r("app.color.main"))
          .width("100%")
          .textAlign(TextAlign.Center)
          .padding(16)
      }
    }
  }
  build() {

    Column() {
      PageHeader({ title: "生活",left: false })

      WaterFlow({ scroller: this.scroller,footer: this.footer}) {
        LazyForEach(this.source, (item: LiveDiscovery) => {
          FlowItem() {
            Column() {
              Image(item.image)
                .width("100%")
                .height(item.height)
                .alt($r("app.media.image_alt"))
                .borderRadius({
                  topLeft: 8,
                  topRight: 8
                })

              Column() {
                Text(item.title)
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor("#333")
                  .margin({ bottom: 4 });

                Text(item.content)
                  .fontSize(12)
                  .fontColor("#666")
                  .maxLines(2)
                  .lineHeight(16)
                  .textOverflow({ overflow: TextOverflow.Ellipsis });
              }
              .width("100%")
              .padding(8)
              .alignItems(HorizontalAlign.Start);
            }
            .backgroundColor(Color.White)
            .borderRadius(8)
            .shadow({
              radius: 6,
              offsetX: 0,
              offsetY: 2,
              color: "#10000000"
            })
            .onClick(() => {
              stack.pushPath({
                name: "DebatePrefer",
                param: item,
              });
            })
          }
        }, (item: LiveDiscovery) => item.id.toString());
      }
      .columnsTemplate("1fr 1fr")
      .columnsGap(8)
      .rowsGap(8)
      .padding(8)
      .layoutWeight(1)
      .edgeEffect(EdgeEffect.Spring)
      .onReachEnd(() => {
        if (this.loading) return // anti-shake;
        this.loading = true;

        setTimeout(() => {
          this.init(8);
          this.loading = false;
        },1500);

      });
    }
    .width("100%")
    .height("100%");
  }
}