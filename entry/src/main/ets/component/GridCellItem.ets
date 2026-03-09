@Component
export struct GridCellItem {
  title: string = "";
  icon: Resource = $r("app.media.ic_folder_empty");
  onCallback: () => void = () => {};
  onDelete: () => void = () => {};
  canDelete: boolean = true;

  @State isEdit: boolean = false;
  @State aniOpacity: number = 0;
  @State aniY: number = 100;

  build() {
    GridItem() {
      Stack() {
        // 主展示层
        Column() {
          Image(this.icon).height(64).margin({ bottom: 4 })
          Text(this.title).fontSize(12).fontColor($r("app.color.light")).maxLines(1)
        }
        .width("100%").padding(12)

        // 删除遮罩层
        if (this.isEdit) {
          Column({ space: 8 }) {
            Image($r("app.media.ic_delete")).width(40)
            Text("删除").fontSize(14).fontColor(Color.White)
          }
          .width("100%").height("100%").justifyContent(FlexAlign.Center)
          .backgroundColor($r("app.color.shade")).borderRadius(8)
          .opacity(this.aniOpacity).translate({ y: this.aniY })
          .onClick((e) => {
            this.onDelete();
            this.isEdit = false;
          })
        }
      }
    }
    .aspectRatio(1).backgroundColor($r("app.color.purity")).borderRadius(8)
    .gesture(
      LongPressGesture().onAction(() => {
        if (!this.canDelete) return;
        this.getUIContext().animateTo({ duration: 300 }, () => {
          this.isEdit = true; this.aniOpacity = 1; this.aniY = 0;
        })
        setTimeout(() => {
          this.getUIContext().animateTo({ duration: 300 }, () => {
            this.isEdit = false; this.aniOpacity = 0; this.aniY = 100;
          })
        }, 5000)
      })
    )
    .onClick(() => { if (!this.isEdit) this.onCallback(); })
  }
}