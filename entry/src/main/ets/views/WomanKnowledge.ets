import { CategoryItem, KnowledgeData } from "../common/GenreInterface";
import PageHeader from "../component/PageHeader";

@Builder
export function Factory() {
  WomanKnowledge();
}
@Entry
@Component
struct WomanKnowledge {
  @State categories: CategoryItem[] = [
    { title: "生理百科", icon: "🌸", color: "#FFF1F1" },
    { title: "心理自愈", icon: "🌿", color: "#F3F0FF" },
    { title: "职场赋能", icon: "💎", color: "#E3F2FD" },
    { title: "美学生活", icon: "🎨", color: "#F1F8E9" }
  ]

  @State knowledgeList: KnowledgeData[] = [
    { title: "职场沟通：如何优雅地拒绝无理要求？", tag: "职场赋能", author: "心理咨询师·陈悦", img: "https://images.unsplash.com/photo-1551836022-d5d88e9218df?q=80&w=400" },
    { title: "换季期：如何科学建立皮肤强韧屏障？", tag: "身体百科", author: "皮肤科医生·王芳", img: "https://images.unsplash.com/photo-1512290923902-8a9f81dc236c?q=80&w=400" },
    { title: "深度冥想：给大脑做一次深度SPA", tag: "心理自愈", author: "冥想导师·李安", img: "https://images.unsplash.com/photo-1506126613408-eca07ce68773?q=80&w=400" }
  ]

  build() {
    NavDestination() {
      PageHeader({title:"女性知识"})
      Stack({ alignContent: Alignment.Top }) {
        Rect().fill("#FDFDFD").expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

        Scroll() {
          Column() {
            Row() {
              Column() {
                Text("Joyful Self")
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .fontColor("#FF8C94")
                  .letterSpacing(2)
                Text("悦己，从关注自己开始")
                  .fontSize(22)
                  .fontWeight(FontWeight.Bolder)
                  .fontColor("#1A1A1A")
                  .margin({ top: 4 })
              }
              .alignItems(HorizontalAlign.Start)

              Blank()

              Image($r("app.media.head"))
                .width(52)
                .height(52)
                .borderRadius(26)
                .shadow({ radius: 15, color: "#15000000", offsetY: 5 })
            }
            .width("100%")
            .padding({ left: 24, right: 24, top: 40, bottom: 20 })

            Stack() {
              Column() {}
              .width("100%")
              .height(190)
              .linearGradient({
                angle: 135,
                colors: [["#FF9A9E", 0.0], ["#FECFEF", 1.0]]
              })
              .borderRadius(32)
              .shadow({ radius: 30, color: "#25FF9A9E", offsetY: 15 })

              Row() {
                Column() {
                  Text("生理期倒计时").fontSize(13).fontColor(Color.White).opacity(0.8)
                  Text("12 Days").fontSize(42).fontWeight(FontWeight.Bolder).fontColor(Color.White).margin({ top: 8 });

                  Row() {
                    Text("卵泡期").fontSize(12).fontColor(Color.White).fontWeight(FontWeight.Bold);
                    Divider().vertical(true).height(10).color(Color.White).margin({ left: 10, right: 10 }).opacity(0.5);
                    Text("宜：有氧运动").fontSize(12).fontColor(Color.White);
                  }
                  .margin({ top: 20 })
                  .backgroundColor("#15FFFFFF")
                  .padding({ left: 14, right: 14, top: 8, bottom: 8 })
                  .borderRadius(20);
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1);

                Stack() {
                  Progress({ value: 65, total: 100, type: ProgressType.Ring })
                    .width(100)
                    .color(Color.White)
                    .style({ strokeWidth: 12, enableSmoothEffect: true });
                  Column() {
                    Text("65%").fontSize(18).fontWeight(FontWeight.Bold).fontColor(Color.White)
                    Text("进度").fontSize(10).fontColor(Color.White).opacity(0.7);
                  }
                }
              }
              .padding(28);
            }
            .width("100%")
            .padding({ left: 20, right: 20 })

            Column() {
              Text("“")
                .fontSize(46)
                .fontColor("#FF8C94")
                .height(30)
                .fontWeight(FontWeight.Bolder)
              Text("自律的意义在于，你有权利选择自己想要的生活。")
                .fontSize(16)
                .fontColor("#475569")
                .lineHeight(26)
                .fontStyle(FontStyle.Italic)
                .textAlign(TextAlign.Center)
                .padding({ left: 30, right: 30, bottom: 15 })
            }
            .width("90%")
            .margin({ top: 30 })
            .backgroundColor(Color.White)
            .borderRadius(24)
            .shadow({ radius: 25, color: "#05000000", offsetY: 10 })

            Grid() {
              ForEach(this.categories, (item: CategoryItem) => {
                GridItem() {
                  Column() {
                    Text(item.icon).fontSize(34).margin({ bottom: 12 })
                    Text(item.title).fontSize(14).fontWeight(FontWeight.Medium).fontColor("#334155")
                  }
                  .width("100%")
                  .height(115)
                  .backgroundColor(item.color)
                  .borderRadius(28)
                  .justifyContent(FlexAlign.Center)
                }
              })
            }
            .columnsTemplate("1fr 1fr")
            .rowsGap(16)
            .columnsGap(16)
            .width("100%")
            .padding(24)

            Column() {
              Text("今日推荐专题")
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .width("100%")
                .margin({ bottom: 15 })

              Stack({ alignContent: Alignment.BottomStart }) {
                Image("https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=800")
                  .width("100%")
                  .height(200)
                  .objectFit(ImageFit.Cover)
                  .borderRadius(24)

                Column() {
                  Text("专题 · 极简主义生活").fontSize(12).fontColor(Color.White).opacity(0.9)
                  Text("如何通过断舍离找回内心的平静？").fontSize(18).fontWeight(FontWeight.Bold).fontColor(Color.White).margin({ top: 6 })
                }
                .padding(20)
                .width("100%")
                .alignItems(HorizontalAlign.Start)
                .linearGradient({
                  angle: 180,
                  colors: [[ "#00000000", 0 ], [ "#99000000", 1 ]]
                })
                .borderRadius({ bottomLeft: 24, bottomRight: 24 })
              }
            }
            .width("100%")
            .padding({ left: 24, right: 24, top: 10 })

            Column({ space: 16 }) {
              Text("发现更多知识").fontSize(18).fontWeight(FontWeight.Bold).width("100%").margin({ top: 20 })

              ForEach(this.knowledgeList, (item: KnowledgeData) => {
                KnowledgeCard({ data: item })
              })
            }
            .width("100%")
            .padding({ left: 24, right: 24, bottom: 60 })
          }
        }
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.Off)
      }
      .width("100%")
      .layoutWeight(1);
    }
    .hideTitleBar(true);
  }
}

@Component
struct KnowledgeCard {
  @Prop data: KnowledgeData;

  build() {
    Row() {
      Column({space: 8}) {
        Text(this.data.tag)
          .fontSize(10)
          .fontColor($r("app.color.main"))
          .fontWeight(FontWeight.Bold)
          .backgroundColor("#FFF1F1")
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          .borderRadius(6);

        Text(this.data.title)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .maxLines(2)
          .lineHeight(22);

        Text(this.data.author)
          .fontSize(12)
          .fontColor($r("app.color.light"));
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .padding(16)

      Image(this.data.img)
        .width(110)
        .height(130)
        .objectFit(ImageFit.Cover)
        .borderRadius({ topRight: 24, bottomRight: 24 })
    }
    .width("100%")
    .backgroundColor(Color.White)
    .borderRadius(24)
    .shadow({ radius: 16, color: $r("app.color.shallow"), offsetY: 8 })
  }
}