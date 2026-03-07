import { display } from "@kit.ArkUI";
import { AppUtil } from "@pura/harmony-utils";
import {
  AD_SPLASH_CODE_ID,
  AD_APP_ID,
  AD_INCENTIVE_CODE_ID,
  AD_STREAM_CODE_ID,
  AD_INSERT_CODE_ID
} from "../common/DataList";

import {
  AdLoadType,
  AdSlotBuilder,
  CSJAdSdk,
  CSJFullAd,
  CSJNativeExpressAd,
  CSJRewardAd,
  CSJSplashAd,
  CSJSplashAdLoadListener,
  CSJSplashAdLoadParam,
  ExpressAdInteractionListener,
  FullAdLoadListener,
  NativeExpressAdListener,
  RewardAdInteractionListener,
  RewardAdLoadListener,
  SDKConfig,
  SDKConfigBuilder
} from "@csj/openadsdk";
import ArrayList from "@ohos.util.ArrayList";

export async function init() {
  const adConfigBuilder = new SDKConfigBuilder();

  const config: SDKConfig = adConfigBuilder
    .appId(AD_APP_ID)
    .appName("feminine")
    .allowShowNotify(true)
    .debug(false)
    .build();

  CSJAdSdk.init(AppUtil.getContext(), config);

  await CSJAdSdk.start();
}

export async function splash(callback: () => void) {
  if (CSJAdSdk.isSdkReady()) {
    try {
      const creator = CSJAdSdk.getAdCreator();
      const screen = display.getDefaultDisplaySync();
      const width: number = screen.width / screen.densityPixels;
      const height: number = screen.height / screen.densityPixels
      let slot = new AdSlotBuilder()
        .setCodeId(AD_SPLASH_CODE_ID)
        .setAdLoadType(AdLoadType.PRELOAD)
        .setAcceptSize(width, height)
        .build();

      let listener: CSJSplashAdLoadListener = {
        onAdLoaded: (ad: CSJSplashAd) => {
          ad.setInteractionListener({
            onDidClose: () => callback(),
            onDidShow: (): void => {

            },
            onDidClick: (): void => {

            },
            onVideoDidPlayFinish: (): void => callback(),
            onVideoDidPlayFail: (): void => {

            }
          });
          ad.showSplashAd(AppUtil.getWindowStage());
        },
        onError: (code: number, message: string)  => {
          console.error("incentive advertisement, loading failure", code, message);
          callback();
        },
        onRenderSuccess: () => {

        },
        onRenderFail: () => callback()
      }

      const param = new CSJSplashAdLoadParam(slot, listener, AppUtil.getUIContext(), 3500);
      creator.loadSplashAd(param);
    } catch (error) {

    }
  } else {
    callback();
  }
}

export async function incentive(callback: () => void) {

  if (CSJAdSdk.isSdkReady()) {
    const creator = CSJAdSdk.getAdCreator();

    try {
      const slot = new AdSlotBuilder()
        .setCodeId(AD_INCENTIVE_CODE_ID)
        .build()

      let interactive: RewardAdInteractionListener = {
        onShow: () => {
        },
        onSkip: () => {
        },
        onClick: () => {
        },
        onComplete: ()=> {
          callback();
        },
        onClose: () => {
        },
        onRewardArrived: () => {}

      }

      let listener: RewardAdLoadListener = {
        onAdLoaded: (ad: CSJRewardAd) => {
          if (!ad) {
            return;
          }
          ad.setInteractionListener(interactive)
          ad.showRewardAd(AppUtil.getWindowStage());
        },
        onAdCached: () => {

        },
        onError: (code: number, message: string) => {
          console.error("incentive advertisement, loading failure", code, message);
        },
      };
      creator.loadRewardAd(slot, listener);
    } catch (error) {

    }
  }
}

export async function stream(context: UIContext,callback?: (ads?: ArrayList<CSJNativeExpressAd>, code?: number, message?: string) => void) {
  if (CSJAdSdk.isSdkReady()) {
    const creator = CSJAdSdk.getAdCreator();

    try {
      const slot = new AdSlotBuilder()
        .setCodeId(AD_STREAM_CODE_ID)
        .build();

      const listener: NativeExpressAdListener = {
        onError: (code: number, message: string) => {
          console.error("information stream, loading failure", code, message);
        },
        onNativeExpressAdLoad: (ads: ArrayList<CSJNativeExpressAd>) => {
          if (ads && ads.length > 0) {
            ads.forEach(ad => {
              ad.setExpressInteractionListener({
                onRenderSuccess: () => {

                },
                onAdShow: () => {},
                onAdClicked: () => {},
                onRenderFail: (code, msg) => console.error("template render failure", code, msg)
              } as ExpressAdInteractionListener);

              ad.render(context);
            });
            callback && callback(ads);
          }
        }
      };

      creator.loadExpressFeedAd(slot, listener);

    } catch (error) {}
  }
}


export async function insert() {
  if (CSJAdSdk.isSdkReady()) {
    const creator = CSJAdSdk.getAdCreator();

    let slot = new AdSlotBuilder()
      .setCodeId(AD_INSERT_CODE_ID)
      .build()

    let listener: FullAdLoadListener = {
      onAdLoaded: (ad: CSJFullAd) => {
        ad.showFullAd(AppUtil.getWindowStage())
      },
      onAdCached: () => {},
      onError: (code: number, message: string) => {
        console.error("new insert screen advertisement failure", code, message)
      }
    }
    creator.loadFullAd(slot, listener)
  }
}