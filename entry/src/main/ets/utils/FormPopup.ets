@CustomDialog
export default struct FormPopup {
  controller: CustomDialogController;
  onConfirm: (map:Map<string,string>) => void = () => {};
  onCancel: () => void = () => {};

  @Prop map:Map<string,string>;
  @Prop title:string;
  build() {
    Column({ space: 16 }) {
      Text(this.title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8 });

      ForEach(Array.from(this.map.keys()),(item:string) => {

        Row({space: 8}) {
          Text(item + ":")
            .width(80)
            .fontSize(14)
            .textAlign(TextAlign.End);
          TextInput({ placeholder: "请输入"+item, text: this.map.get(item) })
            .height(48)
            .layoutWeight(1)
            .fontSize(14)
            .placeholderFont({size: 14})
            .onChange((value: string) => this.map.set(item,value));
        }
      })

      Row() {
        Button("取消")
          .onClick(() =>this.onCancel())
          .backgroundColor(Color.Transparent)
          .fontColor($r("app.color.light"))
          .layoutWeight(1);

        Line().width(1).height(20).backgroundColor($r("app.color.grey"));

        Button("确定")
          .onClick(() => this.onConfirm(this.map))
          .backgroundColor(Color.Transparent)
          .fontColor($r("app.color.main"))
          .layoutWeight(1);
      }
      .width("100%")
      .margin({ top: 8 });
    }
    .padding(16)
    .margin(16)
    .backgroundColor($r("app.color.purity"))
    .borderRadius(16);
  }
}