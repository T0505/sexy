import promptAction from '@ohos.promptAction';
import PageHeader from "../component/PageHeader"
import { insert } from "../common/PangolinAdvertisement";

@Builder
export function Factory() {
  OpinionFeedback();
}

@Component
struct OpinionFeedback {
  @State content: string = "";
  @State contactInfo: string = "";

  aboutToAppear(): void {
    insert();
  }

  build() {
    NavDestination() {
      Column({ space: 16 }) {
        PageHeader({ title: "意见反馈"})
        Column({ space: 16 }) {
          Text("反馈详细内容")
            .fontSize(14)
            .alignSelf(ItemAlign.Start)

          TextArea({text: this.content })
            .onChange((value: string) => this.content = value)
            .fontSize(14)
            .padding(8)
            .minLines(6)
            .borderRadius(5)
            .border({ width: 1 });

          Text("您的联系方式")
            .fontSize(14)
            .alignSelf(ItemAlign.Start)

          TextInput({
            placeholder: "请输入手机号或者邮箱以便客服及时联系您!",
            text: this.contactInfo,
          })
            .onChange((value: string) => {
              this.contactInfo = value;
            })
            .maxLength(11)
            .placeholderFont({size: 12})
            .fontSize(14)
            .height(40)
            .borderRadius(5)
            .padding({ left: 8 })
            .border({ width: 1});

          Button("提交")
            .width("100%")
            .backgroundColor($r("app.color.main"))
            .fontSize(16)
            .borderRadius(5)
            .onClick(() => {
              if (this.content.trim() === "") {
                promptAction.openToast({ message: "请输入反馈内容" }).catch(() => {});
                return;
              }
              promptAction.openToast({ message: "提交成功，感谢您的反馈！" }).catch(() => {});
              this.content = "";
              this.contactInfo = "";
            });

          Column({ space: 8 }) {
            Text("客服在线时间：工作日-9:30-18:00")
              .fontSize(12)
              .fontColor($r("app.color.light"));
            Text("客服邮箱：246601064@qq.com")
              .fontSize(12)
              .fontColor($r("app.color.light"));
          }
        }
        .padding(16)
      }
    }
    .hideTitleBar(true);
  }
}

