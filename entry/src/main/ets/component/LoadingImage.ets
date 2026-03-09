@Component
export default struct LoadingImage {
  @Prop h:string = "100%";
  @Prop b:number[] = [0,0,0,0];
  @Prop url: string;
  @State loading: boolean = true;
  build() {
    Stack() {
      if (this.loading) {
        LoadingProgress()
          .width(40)
          .height(40)
          .color($r("app.color.main"))
      }

      Image(this.url)
        .width("100%")
        .height(this.h)
        .objectFit(ImageFit.Cover)
        .onComplete(() => {
          this.loading = false;
        })
        .onError(() => {
          this.loading = false;
        })
        .borderRadius({
          topLeft: this.b[0],
          topRight: this.b[1],
          bottomRight: this.b[2],
          bottomLeft: this.b[3],
        })
        .alt($r("app.media.image_alt"));

    }
    .width("100%")
    .height(this.h);
  }
}