export class Card implements AttributeModifier<ColumnAttribute> {
  p: Length = 16;
  b: Length = 8;

  constructor(p?: Length,b?: Length) {
    if (p !== undefined) this.p = p
    if (b !== undefined) this.b = b
  }

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance
      .width("100%")
      .padding(this.p)
      .backgroundColor($r("app.color.main"))
      .borderRadius(this.b)
      .shadow({
        radius: 6,
        offsetX: 0,
        offsetY: 2,
        color: $r("app.color.shade")
      })
  }
}