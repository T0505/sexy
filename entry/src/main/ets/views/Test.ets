@Entry
@Component
struct Test {
  @State agreeRatio: number = 70
  @State disagreeRatio: number = 30

  build() {
    Column({ space: 20 }) {
      Row() {

        Stack() {
          Text(`${this.agreeRatio}%`)
            .fontSize(14)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
        .layoutWeight(this.agreeRatio)
        .height("100%")
        .linearGradient({
          angle: 90,
          colors: [['#FF5E5E', 0.0], ['#FF9595', 1.0]]
        })

        Stack() {
          Text(`${this.disagreeRatio}%`)
            .fontSize(14)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
        .layoutWeight(this.disagreeRatio)
        .height("100%")
        .linearGradient({
          angle: 90,
          colors: [['#8DBAFF', 0.0], ['#4A90E2', 1.0]]
        })
      }
      .width("100%")
      .height(44)
      .borderRadius(22)
      .clip(true)
    }
    .padding(20)
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}