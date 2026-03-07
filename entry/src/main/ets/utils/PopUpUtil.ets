@CustomDialog
export default struct PopUpUtil {
  @Builder base() {
    Text(this.description)
      .fontSize(13)
      .lineHeight(18)
      .textIndent(24)
      .alignSelf(ItemAlign.Start)
  }
  @BuilderParam content: () => void = this.base;
  @Prop title:string;
  @Prop description:string;

  controller: CustomDialogController;
  onAgree: () => void = () => {};
  onRefuse: () => void = () => {};

  build() {
    Column() {
      Column({ space: 16 }) {
        Text(this.title)
          .font({size: 18,weight: FontWeight.Bold})
          .fontColor($r("app.color.black"));

        Scroll() {
          this.content();
        }
        .align(Alignment.TopStart)
        .width("100%")
        .padding(8)
        .height(168)
        .edgeEffect(EdgeEffect.None)
        .backgroundColor($r("app.color.shallow"))
        .borderRadius(8)
        .scrollBar(BarState.Off)

        Row({ space: 16 }) {
          Button("拒绝")
            .backgroundColor('#E5E5E5')
            .fontColor($r("app.color.black"))
            .layoutWeight(1)
            .onClick(() => {
              this.onRefuse();
              this.controller.close();
            });

          Button("同意")
            .backgroundColor($r("app.color.main"))
            .fontColor('#FFF')
            .layoutWeight(1)
            .onClick(() => {
              this.onAgree();
              this.controller.close();
            });
        }
        .padding({left: 16,right: 16})
      }
      .width("100%")
      .padding({top: 32,bottom: 32,left: 16,right: 16})
      .borderRadius(8);
    }
    .width("100%");
  }
}