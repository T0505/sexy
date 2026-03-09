@CustomDialog
export struct IndividualPickerDrawer {
  controller: CustomDialogController;

  @Prop title: string = "请选择";
  @Prop unit: string = "";
  @Prop startValue: number = 0;
  @Prop endValue: number = 100;
  @Prop defaultValue: string = "0.0";

  onAccept: (value: string) => void = () => {};

  private integerRange: string[] = [];
  private decimalRange: string[] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  @State selectedIndices: number[] = [0, 0];

  aboutToAppear() {
    for (let i = this.startValue; i <= this.endValue; i++) {
      this.integerRange.push(i.toString());
    }

    const parts = this.defaultValue.split(".");
    const intPart = parts[0];
    const decPart = parts.length > 1 ? parts[1] : "0";

    const intIndex = this.integerRange.indexOf(intPart);
    const decIndex = this.decimalRange.indexOf(decPart);

    this.selectedIndices = [
      intIndex !== -1 ? intIndex : 0,
      decIndex !== -1 ? decIndex : 0
    ];
  }

  build() {
    Column() {
      Row() {
        Text("取消")
          .fontColor($r("app.color.light"))
          .onClick(() => {
            this.controller.close();
          });

        Text(this.title)
          .fontSize(18)
          .fontWeight(FontWeight.Bold);

        Text("确定")
          .fontColor($r("app.color.main"))
          .onClick(() => {
            const result = `${this.integerRange[this.selectedIndices[0]]}.${this.decimalRange[this.selectedIndices[1]]}`;
            this.onAccept(result);
            this.controller.close();
          })
      }
      .width("100%")
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)

      Stack() {
        TextPicker({ range: [this.integerRange, this.decimalRange], selected: this.selectedIndices })
          .canLoop(false)
          .height(200)
          .disappearTextStyle({color: Color.Gray, font: {size: 14}})
          .textStyle({color: Color.Black, font: {size: 18}})
          .onChange((_value: string | string[], index: number | number[]) => {
            if (Array.isArray(index)) {
              this.selectedIndices = index;
            }
          })
        Text(".")
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .width(20)
          .textAlign(TextAlign.Center)
        Row() {

          Blank().layoutWeight(1)

          Text("gk")
            .fontSize(16)
            .fontColor(Color.Gray)
            .margin({ right: 24 })
        }
        .width("100%")
        .hitTestBehavior(HitTestMode.None)
      }
      .width("100%")
      .padding({ bottom: 20 })
    }
    .backgroundColor($r("app.color.purity"))
    .borderRadius({ topLeft: 16, topRight: 16 })
    .width("100%");
  }
}