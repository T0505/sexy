import { HeaderBack, WebH5Type } from '../common/GenreInterface'
import { webview } from "@kit.ArkWeb"
import PageHeader from "../component/PageHeader"
import { stack } from '../common/ShareStorage';
import { RandomUtil } from '@pura/harmony-utils';

@Builder
export function Factory() {
  WebPage();
}

@Component
struct WebPage {
  @State title: string = "";
  @State url: string = "";

  build() {
    NavDestination() {
      PageHeader({ title: this.title });
      Column() {
        Web({
          src: this.url,
          controller: new webview.WebviewController()
        })
          .layoutWeight(1)
          .multiWindowAccess(false)
          .zoomAccess(true)
          .databaseAccess(true)
          .cacheMode(CacheMode.Default)//默认
          .fileAccess(true)
          .mixedMode(MixedMode.All)
          .allowWindowOpenMethod(true)
          .imageAccess(true)
          .onlineImageAccess(true)
          .javaScriptAccess(true);
      }
      .width("100%")
      .layoutWeight(1)
    }
    .hideTitleBar(true)
    .onBackPressed(() => {
      const result: HeaderBack = { back: true, id: RandomUtil.generateUUID36() };
      stack.pop(result);
      return true;
    })
    .onReady((context:NavDestinationContext) => {
      const params = context.pathInfo.param as WebH5Type;
      this.title = params.title;
      this.url = params.url;
    });
  }
}