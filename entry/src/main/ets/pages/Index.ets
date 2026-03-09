import PopUpUtil from "../utils/PopUpUtil";
import common from "@ohos.app.ability.common";
import { get, save } from "../utils/DatabaseUtil";
import { stack } from "../common/ShareStorage";
import { HeaderBack, WebH5Type } from "../common/GenreInterface";
import { PRIVACY_POLICY, USER_AGREEMENT } from "../common/ExternalLink";
import { splash } from "../common/PangolinAdvertisement";
import { init, onEventObject,onProfileSignIn } from "@umeng/analytics";
import { AAID } from "@kit.PushKit";

@Entry
@Component
struct Index {
  @State show: boolean | null = null;
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  controller: CustomDialogController = new CustomDialogController({
    builder: PopUpUtil({
      title: "隐私政策与用户协议",
      description: "",
      onAgree: async () => {
        this.show = true;
        await save(this.context, "argument", this.show);

        init();

        try {
          const aaid = await AAID.getAAID();
          if (aaid) {
            onProfileSignIn(aaid, "AAID");
            console.info(`um AAID bind is success: ${aaid}`);
          }
        } catch (err) {
          const error = err as BusinessError;
          console.error(`obtain AAID is fail: ${error.code} - ${error.message}`);
        }

        onEventObject("app_user_agree", {
          "time": new Date().getTime().toString(),
          "status": "success"
        });

        splash(() => {
          setTimeout(() => {
            stack.replacePath({ name: "Container" })
          },2000)
        });
      },
      onRefuse: () => {
        this.context.terminateSelf().catch(() => {});
      },
      content: () => {
        this.content();
      },
    }),
    autoCancel: false,
  });

  async aboutToAppear(): Promise<void> {
    try {
      this.show = await get<boolean>(this.context,"argument");
      if(this.show) {
        splash(() => {
          setTimeout(() => {
            stack.replacePath({ name: "Container" })
          },2000)
        });
      } else {
        this.controller.open();
      }
    } catch (error) {
      console.log(error)
    }
  }

  build() {
    Navigation(stack) {
      Column({ space: 16 }) {
        Image($r("app.media.startIcon"))
          .width(80)
          .borderRadius(8);

        Text($r("app.string.app_name"))
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
      .justifyContent(FlexAlign.Center)
      .width("100%")
      .height("100%");
    }
    .hideTitleBar(true)
  }
  @Builder content() {
    Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
      Text("请您仔细阅读")
        .fontSize(13)
        .textIndent(24)
        .fontColor(Color.Black)
        .lineHeight(18);
      Text("《隐私政策》")
        .fontColor($r("app.color.main"))
        .fontSize(13)
        .decoration({
          type: TextDecorationType.Underline,
          color: $r("app.color.main")
        })
        .lineHeight(18)
        .onClick(() => {
          const param: WebH5Type = {
            title:  "隐私政策",
            url: PRIVACY_POLICY
          };
          stack.pushPathByName("WebH5Page",param,(header) => {
            const back:HeaderBack = header.result as HeaderBack;
            if (back.back) {
              this.controller.open();
            }
          });
          this.controller.close();
        });
      Text("和")
        .fontSize(13)
        .fontColor(Color.Black)
        .lineHeight(18);
      Text("《用户协议》")
        .fontSize(13)
        .lineHeight(18)
        .decoration({
          type: TextDecorationType.Underline,
          color: $r("app.color.main")
        })
        .fontColor($r("app.color.main"))
        .onClick(() => {
          const param: WebH5Type = {
            title:  "用户协议",
            url: USER_AGREEMENT
          };
          stack.pushPathByName("WebH5Page",param,(header) => {
            const back:HeaderBack = header.result as HeaderBack;
            if (back.back) {
              this.controller.open();
            }
          });
          this.controller.close();
        });
      Text("的全部内容，其中包括但不限于个人信息的收集、存储、使用、共享与保护规则，以及您作为用户所享有的权利、应履行的义务、服务使用规范和争议解决方式等重要条款。您点击\"同意\"按钮，即表示您已认真阅读并自愿接受本协议所有条款的约束，本应用将依据协议约定为您提供相关服务；若您不同意，将无法使用本应用的全部功能，您可随时退出本弹窗并停止使用。")
        .fontSize(13)
        .fontColor(Color.Black)
        .lineHeight(18);
    }
    .width("100%")
  }
}