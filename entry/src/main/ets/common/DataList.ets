import { TabNav,LinkUse,Vocation,HomeMethod,DoctorAdvice } from "../common/GenreInterface";
import { PRIVACY_POLICY,USER_AGREEMENT } from "../common/ExternalLink"
import { AppUtil } from "@pura/harmony-utils"
import { stack } from "./ShareStorage";
import { util } from "@kit.ArkTS";

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
    title: "镜子",
    icon: $r("app.media.ic_mirror"),
    active: $r("app.media.ic_mirror_active")
  },{
    title: "我的",
    icon: $r("app.media.ic_profile"),
    active: $r("app.media.ic_profile_active")
  },
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
    callback: () => {
      stack.pushPath({
        name: "DiaryBag"
      });
    },
  }, {
    icon: $r("app.media.ic_weight"),
    title: "今日体重",
  }, {
    icon: $r("app.media.ic_chart"),
    title: "总揽",
    callback: () => {
      stack.pushPath({
        name: "Overview"
      });
    }
  }, {
    icon: $r("app.media.ic_health"),
    title: "健康建议",
    callback: () => {
      stack.pushPath({
        name: "HealthAdvice"
      });
    }
  }, {
    icon: $r("app.media.ic_knowledge"),
    title: "女性知识",
    callback: () => {}
  }
];


export {
  methods,
}


const HEALTH_ADVICE_DATA: DoctorAdvice[] = [
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=600",
      "https://images.unsplash.com/photo-1490645935967-10de6ba17061?q=80&w=600",
      "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=600"
    ],
    head: "饮食篇",
    content: "深色蔬菜要多吃，建议占据每日蔬菜摄入量的一半，其中的植物化学物质对预防慢性病至关重要。剩菜剩饭别久留，尽量在24小时内食用完毕，减少细菌滋生。食盐摄入要控制，每日不宜超过5克（约一啤酒瓶盖），预防高血压。红肉（猪牛羊）补血更靠谱，但建议以瘦肉为主，每周摄入不超过500克，鱼禽肉等白肉可以适当多吃！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1541480601022-2308c0f02487?q=80&w=600",
      "https://images.unsplash.com/photo-1520206159849-c9c762a3dd59?q=80&w=600"
    ],
    head: "睡眠篇",
    content: "7-9小时是成年人的黄金睡眠时长，睡眠不足会显著降低免疫力和代谢水平。熬夜伤身难补回，长期的昼夜节律紊乱会增加心脏压力和患癌风险。睡前饮食要清淡，晚餐离睡眠应至少间隔3小时，避免胃酸倒流。睡眠环境要舒适，保持全黑、凉爽（18-22℃）且安静的状态，睡前1小时关掉电子设备，减少蓝光对褪黑素的抑制！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1434494878577-86c23bcb06b9?q=80&w=600",
      "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?q=80&w=600",
      "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=600"
    ],
    head: "减肥篇",
    content: "科学减肥不极端，严禁过度节食，否则掉的是肌肉而非脂肪，极易造成代谢崩溃。饮食控制加运动是减脂的唯一捷径。餐前喝水减食量，300-500毫升温水能显著增加饱腹感。充足水分促代谢，每日摄入约2000毫升水。关注体脂率而非单一的体重数字，每周减重0.5-1公斤是最为健康且不易反弹的节奏！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=600",
      "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=600"
    ],
    head: "运动篇",
    content: "适量运动强体魄，每周建议进行150分钟中等强度有氧运动（如快走、慢跑）。中老年选低强度运动，太极、散步或八段锦更温和。热身拉伸不可少，运动前激活关节，运动后拉伸纤维，有效避免运动损伤。运动时间灵活选，清晨空气清新，傍晚燃脂效率高，但睡前2小时应停止高强度运动以免影响入睡！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?q=80&w=600",
      "https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?q=80&w=600"
    ],
    head: "护肤篇",
    content: "清洁保湿加防晒是护肤的三大支柱，防晒更是抗老的核心。面膜适度别过度，每周2-3次即可，过度敷面膜会导致角质层过度水合从而引发敏感。痘痘治疗要综合，除了局部用药，还需控制高糖高油饮食并减少熬夜。私处清洁别过度，强力洗液会破坏酸碱平衡，日常用清水冲洗才是最稳健的护理方式！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1582213726893-edc10ff0b1a1?q=80&w=600",
      "https://images.unsplash.com/photo-1518152006812-edab29b069ac?q=80&w=600"
    ],
    head: "生殖篇",
    content: "初次性行为不出血是正常生理现象，处女膜的形状和厚度因人而异。避孕方法要科学，安全套既避孕又防病，避孕药需在医生指导下服用。性生活时间因人异，质量优于时长。私处清洁用清水，无论男女，房事前后的清洁都能显著降低泌尿系统感染风险。定期进行生殖系统专项检查，早预防早安心！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1579684385127-1ef15d508118?q=80&w=600",
      "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?q=80&w=600"
    ],
    head: "防病篇",
    content: "癌症筛查要趁早，特别是40岁以后的胃肠镜检查能挽救无数生命。HPV疫苗防宫颈癌，建议在发生性行为前尽早接种。口腔健康别忽视，每年一次洗牙和口腔检查是预防全身炎症的基础。结直肠癌早发现，注意观察排便习惯和粪便形状的变化。趁热吃喝伤食道，放凉至50℃以下再入口最安全！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?q=80&w=600",
      "https://images.unsplash.com/photo-1471864190281-a93a3070b6de?q=80&w=600"
    ],
    head: "用药篇",
    content: "伤口处理用碘伏，刺激性小且杀菌效果好。用药剂量要遵医嘱，切勿自行加量或减量。胶囊别去壳，外壳是为了保护药物在特定部位吸收。药物饮料别同服，茶水、咖啡或果汁中的成分可能与药物发生化学反应。头孢类药物前后一周禁酒，警惕双硫仑样反应导致的生命危险！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1516589174184-c6858b111b0c?q=80&w=600",
      "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?q=80&w=600"
    ],
    head: "急救篇",
    content: "烫伤冷水冲，至少持续15分钟降温，严禁涂抹牙膏或酱油。气道梗阻海姆立克，利用腹部冲击产生的气流将异物排出。动物咬伤要冲洗，用流动肥皂水和大量清水交替冲洗15分钟并及时就医。癫痫发作防误吸，保持侧卧位，移开周围危险物品，切勿往口中塞入硬物或过度按压四肢！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
      "https://images.unsplash.com/photo-1550505393-fa197235d502?q=80&w=600",
      "https://images.unsplash.com/photo-1628151015968-3a4429e9ef04?q=80&w=600"
    ],
    head: "误区篇",
    content: "晨起淡盐水不排毒，反而会增加心脑血管负担，白开水才是最佳选择。骨头汤不补钙，汤里更多的是脂肪和嘌呤，补钙应选牛奶或豆制品。食物相克是谣言，只要食材新鲜卫生，多样化搭配才是健康基础。乳酸菌饮料要选对，注意糖含量，许多所谓的健康饮料热量甚至高于可乐！"
  }
];
export {
  HEALTH_ADVICE_DATA,
  DoctorAdvice
}