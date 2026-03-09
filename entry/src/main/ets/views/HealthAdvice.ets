import PageHeader from "../component/PageHeader";
import { DoctorAdvice, HEALTH_ADVICE_DATA } from "../common/DataList";
import { Card } from "../utils/Patterns";
import LoadingImage from "../component/LoadingImage";

@Builder
export function Factory() {
  HealthAdvice();
}

@Component
struct HealthAdvice {
  build() {
    NavDestination() {
      Scroll() {
        Column() {
          PageHeader({ title: "健康建议" });
          Column({ space: 32 }) {
            ForEach(HEALTH_ADVICE_DATA, (d: DoctorAdvice) => {
              AdviceCardItem({ d: d })
            })
          }
          .width("100%")
        }
        .width("100%");
      }
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring);
    }.hideTitleBar(true);
  }
}

@Component
struct AdviceCardItem {
  @Prop d: DoctorAdvice;
  @State isAutoPlay: boolean = false;
  private controller: SwiperController = new SwiperController();

  build() {
    Column() {
      Swiper(this.controller) {
        ForEach(this.d.images, (i: string) => {
          LoadingImage({h:"200", url: i });
        })
      }
      .autoPlay(this.isAutoPlay)
      .interval(3000)
      .loop(true)
      .indicator(
        new DotIndicator()
          .color($r("app.color.shallow"))
          .selectedColor($r("app.color.main"))
      )
      .curve(Curve.LinearOutSlowIn)
      .onVisibleAreaChange([0.0, 0.5, 1.0], (isVisible: boolean, currentRatio: number) => {
        if (isVisible && currentRatio >= 0.5) {
          this.isAutoPlay = true;
        } else {
          this.isAutoPlay = false;
        }
      })

      Column({ space: 8 }) {
        Column() {
          Text(this.d.head)
            .font({ size: 16, weight: FontWeight.Medium });
        }
        .width("100%")
        .alignItems(HorizontalAlign.Start)
        .attributeModifier(new Card(8, 4));

        Text(this.d.content)
          .fontSize(14)
          .textIndent(24)
          .lineHeight(20);
      }
      .padding(8);
    }
    .width("100%")
  }
}