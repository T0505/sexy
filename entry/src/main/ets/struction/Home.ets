import { Schedule,Vocation,HomeMethod,TodayWeight } from "../common/GenreInterface";
import {vocations,dates,methods } from "../common/DataList";
import PageHeader from "../component/PageHeader";
import { Card } from "../utils/Patterns";
import { IndividualPickerDrawer } from "../utils/IndividualPickerDrawer";
import { save,get } from "../utils/DatabaseUtil";
import { common } from "@kit.AbilityKit";

@Component
export default struct Home {
  @State schedules: Schedule[] = [];
  @State month: number = 0;
  @State open: boolean = false;
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private controller:CustomDialogController =  new CustomDialogController({
    builder: IndividualPickerDrawer({
      title: "记录体重",
      unit: "kg",
      startValue: 10,
      endValue: 500,
      defaultValue: "50.4",
      onAccept: async (v) => {
        const w:TodayWeight = {
          weight: v,
          date: new Date(),
        };

        let array = await get<TodayWeight[]>(this.context,"weight");
        if(array) {
          const index = array.findIndex(item => new Date(item.date).toDateString() === new Date(w.date).toDateString());
          if (index !== -1) {
            array[index] = w;
          } else {
            array.push(w);
          }
        } else {
          array = [w];
        }

        save(this.context,"weight",array);
      }
    }),
    alignment: DialogAlignment.Bottom,
    customStyle: true,
    maskColor: $r("app.color.opacity"),
  });

  aboutToAppear(): void {

    const date = new Date();
    this.month = date.getMonth();
    const days = new Date(date.getFullYear(),this.month+1,0).getDate();
    const week = new Date(date.getFullYear(),this.month,1).getDay();

    for (let i = 1; i < week; i++) {
      this.schedules.push({
        day: 0,
        status: 0
      });
    }
    for(let i = 0; i < days; i++) {
      this.schedules.push({
        day: i + 1,
        status: 0
      });
    }
  }

  build() {
    Column() {
      PageHeader({ title: "首页" ,left : false});

      Scroll() {
        Column({space: 8}) {
          Column() {
            Row() {
              Column({space: 8}) {
                Text("月经期")
                  .fontColor($r("app.color.purity"));
                Text("距离下次月经还有30天")
                  .fontSize(12)
                  .fontColor($r("app.color.purity"));
              }
              .alignItems(HorizontalAlign.Start);

              Row({space: 8}) {
                Text("第")
                  .lineHeight(32)
                  .fontColor($r("app.color.purity"));
                Text("1")
                  .lineHeight(32)
                  .font({size: 32,weight:FontWeight.Bold,family: "AliPuHuiTi-Bold"})
                  .fontColor($r("app.color.purity"))
                Text("天")
                  .lineHeight(32)
                  .fontColor($r("app.color.purity"));
              }
              .alignItems(VerticalAlign.Bottom);
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .width("100%");
          }
          .width("100%")
          .attributeModifier(new Card());

          Column({space: 16}) {

            Grid() {
              ForEach(
                dates,
                (s: string) => {
                  GridItem() {
                    Text(s)
                      .fontSize(14)
                      .fontColor($r("app.color.purity"));
                  }
                  .height(32);
                },
                (s: string) => s
              )
              ForEach(
                this.schedules,
                (s: Schedule) => {
                  GridItem() {
                    if(s.day) {
                      if(s.day === new Date().getDate()) {
                        Text("今")
                          .fontColor($r("app.color.main"))
                          .fontWeight(FontWeight.Bold);
                      } else {
                        Text(s.day.toString());
                      }
                    }
                  }
                  .borderRadius(4)
                  .borderWidth(1)
                  .borderColor($r("app.color.tint"))
                  .backgroundColor($r("app.color.purity"))
                  .aspectRatio(1);
                },
                (s: Schedule,index: number) => index+s.day.toString()
              )
            }
            .columnsGap(1)
            .rowsGap(1)
            .columnsTemplate("1fr 1fr 1fr 1fr 1fr 1fr 1fr");

            Row({space: 8}) {
              ForEach(
                vocations,
                (vocation: Vocation) => {
                  Row({space: 4}) {
                    Row()
                      .width(16)
                      .height(16)
                      .borderRadius(8)
                      .backgroundColor(vocation.color);
                    Text(vocation.title)
                      .fontColor($r("app.color.white"))
                      .fontSize(12);
                  }
                },
                (vocation: Vocation) => vocation.title
              );
            }
            .width("100%")
          }
            .attributeModifier(new Card(8));

          Column({space: 8}) {
            Row({space: 8}) {
              Image($r("app.media.ic_menstruation"))
                .height(24)
                .width(24);
              Column() {
                Row() {
                  Text("月经来了")
                    .fontSize(14);
                  Toggle({ type: ToggleType.Switch, isOn: this.open })
                    .selectedColor($r("app.color.main"));
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .height(48)
                .width("100%");
              }
              .layoutWeight(1);
            }
            .padding({left: 16,right: 16})
            .borderRadius(8)
            .backgroundColor($r("app.color.purity"))
            .width("100%");

            Column() {
              ForEach(
                methods,
                (m: HomeMethod,i:number) => {
                  Row({space: 8}) {
                    Image(m.icon)
                      .height(24)
                      .width(24);
                    Column() {
                      Row() {
                        Text(m.title)
                          .fontSize(14);
                        Image($r("app.media.ic_next"))
                          .width(24)
                          .height(24)
                      }
                      .padding({right: 16})
                      .justifyContent(FlexAlign.SpaceBetween)
                      .height(48)
                      .width("100%");

                      if(i != methods.length - 1) {
                        Divider()
                          .color($r("app.color.main"));
                      }
                    }
                    .layoutWeight(1);
                  }
                  .width("100%")
                  .onClick(() => {
                    if (m.callback) {
                      m.callback();
                    } else {
                      this.controller.open();
                    }
                  });
                },
                (s: HomeMethod) => s.title
              );
            }
            .padding({left: 16})
            .borderRadius(8)
            .backgroundColor($r("app.color.purity"))
            .width("100%");
          }
          .attributeModifier(new Card(8));

          Blank()
            .layoutWeight(1);
        }
        .width("100%");
      }
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .layoutWeight(1)
      .padding(8)
      .width("100%");
    }
    .width("100%")
    .height("100%");
  }
}