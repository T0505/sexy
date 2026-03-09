import PageHeader from "../component/PageHeader";

@Component
export default struct Home {
  build() {
    Column() {
      PageHeader({ title: "镜子",left: false });
    }
    .width("100%")
    .height("100%");
  }
}