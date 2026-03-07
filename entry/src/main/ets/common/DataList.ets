import { TabNav,LinkUse,Vocation,HomeMethod } from "../common/GenreInterface";
import { PRIVACY_POLICY,USER_AGREEMENT } from "../common/ExternalLink"
import { AppUtil } from "@pura/harmony-utils"

const TabsData:TabNav[] = [
  {
    title: "首页",
    icon: $r("app.media.ic_home"),
    active: $r("app.media.ic_home_active")
  },{
    title: "生活",
    icon: $r("app.media.ic_live"),
    active: $r("app.media.ic_live_active")
  },{
    title: "我的",
    icon: $r("app.media.ic_profile"),
    active: $r("app.media.ic_profile_active")
  }
];
export {
  TabNav,
  TabsData
}

const LinkData:LinkUse[] = [
  {
    title: "隐私政策",
    icon: $r("app.media.ic_privacy_policy"),
    name: "WebH5Page",
    url: PRIVACY_POLICY
  },{
    title: "用户协议",
    icon: $r("app.media.ic_user_agreement"),
    name: "WebH5Page",
    url: USER_AGREEMENT
  },{
    title: "用户反馈",
    icon: $r("app.media.ic_user_feedback"),
    name: "OpinionFeedback"
  },{
    title: "当前版本：" + AppUtil.getVersionName(),
    icon: $r("app.media.ic_current_version"),
  }
];

export {
  LinkUse,
  LinkData
}

const AD_SPLASH_CODE_ID = "894223619";
const AD_INCENTIVE_CODE_ID = "975610668";
const AD_STREAM_CODE_ID = "975612489";
const AD_INSERT_CODE_ID = "975622122";
const AD_APP_ID = "5782912";

export {
  AD_APP_ID,
  AD_SPLASH_CODE_ID,
  AD_INCENTIVE_CODE_ID,
  AD_STREAM_CODE_ID,
  AD_INSERT_CODE_ID
}

const vocations:Vocation[] = [
  {
    color:$r("app.color.red"),
    title: "例假期",
  },{
    color:$r("app.color.orange"),
    title: "易孕期",
  },{
    color:$r("app.color.yellow"),
    title: "排卵日",
  },{
    color:$r("app.color.green"),
    title: "安全期",
  },
];
const dates: string[] = ["一","二","三","四","五","六","日"];

export {
  vocations,
  dates
}

const methods: HomeMethod[] = [
  {
    icon: $r("app.media.ic_daily"),
    title: "日记",
    callback: () => {}
  }, {
    icon: $r("app.media.ic_weight"),
    title: "今日体重",
    callback: () => {}
  }, {
    icon: $r("app.media.ic_chart"),
    title: "总揽",
    callback: () => {}
  }, {
    icon: $r("app.media.ic_health"),
    title: "健康建议",
    callback: () => {}
  }, {
    icon: $r("app.media.ic_knowledge"),
    title: "女性知识",
    callback: () => {}
  }
];


export {
  methods,
}
