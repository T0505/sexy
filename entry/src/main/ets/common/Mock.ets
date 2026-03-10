import { DoctorAdvice } from "./GenreInterface";
import { util } from "@kit.ArkTS";

interface LiveDiscovery {
  id: number;
  title: string;
  content: string;
  image: string;
  height?: number;
  agree: number;
  oppose: number;
  status: number;
}

const liveDiscoveryDate: LiveDiscovery[] = [
  {
    id: 1,
    title: "情绪稳定VS浪漫惊喜",
    content: "在亲密关系中，我们究竟是在寻找一个避风港，还是在寻找火花？有人认为永远情绪稳定的人才能提供长久的安全感，它是生活的底色；而有人则认为，没有浪漫与惊喜的爱情只是一滩死水，偶尔的情绪起伏才是生命力的体现。你更倾向于选择波澜不惊的平淡，还是轰轰烈烈的绚烂？",
    image: "https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=500&auto=format&fit=crop",
    height: 320,
    agree: 1250,
    oppose: 430,
    status: 0
  },
  {
    id: 2,
    title: "悦己消费是陷阱吗",
    content: "当“爱自己”被简化为“买买买”，这究竟是女性意识的觉醒，还是资本市场量身定制的消费陷阱？我们通过消费获得瞬间的掌控感和愉悦感，但这种多巴胺带来的快乐往往转瞬即逝。悦己的本质应该是精神的富足还是物质的堆砌？在品牌塑造的优越感中，我们是否正在丢失真正的独立思考？",
    image: "https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=500&auto=format&fit=crop",
    height: 240,
    agree: 890,
    oppose: 1100,
    status: 0
  },
  {
    id: 3,
    title: "职场女性该拼命吗",
    content: "面对职场中无形的天花板和性别偏见，女性是否必须付出比男性多倍的努力才能获得同样的认可？有人主张拼命向上争夺话语权，认为这是改变规则的唯一途径；也有人提倡优雅转身，不再参与无谓的内耗，转而追求生活质量与身心健康。在社会地位与个人幸福之间，女性的平衡木到底该怎么走？",
    image: "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=500&auto=format&fit=crop",
    height: 330,
    agree: 1560,
    oppose: 210,
    status: 0
  },
  {
    id: 4,
    title: "容貌焦虑如何和解",
    content: "在一个颜值即正义、滤镜无处不在的时代，我们对美的定义正变得前所未有的单一。每一处细微的瑕疵似乎都被无限放大，成为焦虑的源头。是应该通过现代科技手段不断修正自我以迎合大众审美，还是应该学会停止这种自我审判，接受身体的独特性？真正的审美自由，是否意味着我们有权选择“不完美”？",
    image: "https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?q=80&w=500&auto=format&fit=crop",
    height: 270,
    agree: 2300,
    oppose: 150,
    status: 0
  },
  {
    id: 5,
    title: "门当户对过时了吗",
    content: "现代婚姻中，三观的契合被视为基石，但经济实力的对等依然是无法回避的现实。有人坚信“情饮水饱”，认为爱可以跨越一切阶层鸿沟；也有人认为，消费习惯、社交圈层以及原生家庭带来的价值观差异，最终会在柴米油盐中击碎浪漫。在选择伴侣时，你认为精神的共鸣和现实的门槛，哪个更保鲜？",
    image: "https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=500&auto=format&fit=crop",
    height: 320,
    agree: 1120,
    oppose: 980,
    status: 0
  },
  {
    id: 6,
    title: "恋爱脑是否需要拯救",
    content: "为爱赴汤蹈火、全心投入，究竟是孤注一掷的勇敢，还是丧失自我的迷失？在清醒理智成为主流叙事的今天，“恋爱脑”似乎成了一个贬义词。但如果一段感情里充满了算计与利弊权衡，那还是纯粹的爱吗？我们到底该叫醒那些沉溺其中的灵魂，还是该羡慕他们依然拥有这种奋不顾身的能力？",
    image: "https://images.unsplash.com/photo-1490367532201-b9bc1dc483f6?q=80&w=500&auto=format&fit=crop",
    height: 280,
    agree: 670,
    oppose: 1450,
    status: 0
  },
  {
    id: 7,
    title: "办公室恋情该支持吗",
    content: "朝夕相处的职场是最容易滋生情愫的场所，但也可能成为职业发展的雷区。支持者认为这种关系知根知底，能互相扶持；反对者则担忧私生活会干扰专业决策，一旦感情破裂更会导致尴尬甚至丢掉工作。在冰冷的办公楼里寻找温暖的爱，究竟是人之常情，还是对职业道德的挑战？",
    image: "https://images.unsplash.com/photo-1522071820081-009f0129c71c?q=80&w=500&auto=format&fit=crop",
    height: 300,
    agree: 450,
    oppose: 1200,
    status: 0
  },
  {
    id: 8,
    title: "年龄是女性的束缚吗",
    content: "30岁结婚、35岁定型、40岁退居二线……社会对女性的人生进度表制定了严苛的刻度。有人在年龄焦虑中匆忙成家立业，也有人拒绝被数字化，认为每个年龄段都有其独特的生命力。年龄究竟是阻碍我们尝试新事物的无形枷锁，还是积攒智慧后的自由勋章？你愿意在什么样的节奏里老去？",
    image: "https://images.unsplash.com/photo-1520333789090-1afc82db536a?q=80&w=500&auto=format&fit=crop",
    height: 340,
    agree: 1890,
    oppose: 120,
    status: 0
  },
  {
    id: 9,
    title: "独居是孤独还是享受",
    content: "一个人的房间，是面对孤独的无奈，还是掌控生活的极致自由？随着独居女性群体的扩大，我们开始重新审视孤独。独居意味着可以完全按照自己的节奏生活，不必迁就，不必戴上面具。但当生病、遇到困难或夜深人静时，那份孤独感也无处遁形。你认为独居是一种临时的状态，还是一种值得追求的生活方式？",
    image: "https://images.unsplash.com/photo-1516110833967-0b5716ca1387?q=80&w=500&auto=format&fit=crop",
    height: 290,
    agree: 1450,
    oppose: 320,
    status: 0
  },
  {
    id: 10,
    title: "物质是爱情的前提吗",
    content: "没钱就不配拥有爱情吗？这个现实的问题背后是当代年轻人对生活成本的恐惧。有人认为物质是爱情的“保命符”，贫贱夫妻百事哀是不变的真理；也有人坚信，真正的爱是可以共同度过寒冬的，物质可以创造，但灵魂的契合不可替代。在现实与浪漫的博弈中，你的底线在哪里？",
    image: "https://images.unsplash.com/photo-1518133910546-b6c2fb7d79e3?q=80&w=500&auto=format&fit=crop",
    height: 310,
    agree: 1670,
    oppose: 540,
    status: 0
  },
  {
    id: 11,
    title: "丁克生活幸福吗",
    content: "选择不育是自私地逃避责任，还是理性地选择了另一种更高质量的生活？丁克家庭将原本属于孩子的时间、精力和财富转嫁到自我实现和二人世界中，这种选择正受到越来越多精英女性的认可。但在传统观念和老后的养老问题面前，这种幸福是否带有某种预支的脆弱感？你如何看待没有孩子的家庭？",
    image: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=500&auto=format&fit=crop",
    height: 280,
    agree: 880,
    oppose: 920,
    status: 0
  },
  {
    id: 12,
    title: "坦白隐私是信任吗",
    content: "爱人之间应该百分之百透明，还是保留一块属于自己的、谁也无法进入的私密领地？有人觉得隐瞒就是背叛的开始，分享所有手机密码、过往隐私才是真爱；有人则认为，健康的距离感才是关系的保鲜剂。在信任与隐私的边界线上，我们该如何划定那条既能给对方安全感，又能让自己呼吸的红线？",
    image: "https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=500&auto=format&fit=crop",
    height: 300,
    agree: 640,
    oppose: 1300,
    status: 0
  },
  {
    id: 13,
    title: "加班文化该拒绝吗",
    content: "拒绝加班是缺乏责任心、自寻职业死路的表现，还是捍卫生活底线、反抗低效内耗的英雄主义？在职场竞争日益激烈的今天，女性往往面临更复杂的处境：不加班可能被认为无法兼顾家庭，拼命加班又可能牺牲身心健康。我们该顺应环境的潜规则，还是勇敢地做那个准点下班的“逆行者”？",
    image: "https://images.unsplash.com/photo-1524758631624-e2822e304c36?q=80&w=500&auto=format&fit=crop",
    height: 320,
    agree: 2100,
    oppose: 180,
    status: 0
  },
  {
    id: 14,
    title: "拒绝的艺术难学吗",
    content: "讨好型人格的背后，是对失去社交关系的恐惧。很多女性在生活中扮演着“救火员”的角色，习惯性地答应所有人的要求。学会说“不”是否会真的毁掉人际关系，还是能让你赢得更多的尊重和清晰的社交边界？拒绝别人不仅需要勇气，更需要技巧。你是一个懂得适时拒绝的人吗？",
    image: "https://images.unsplash.com/photo-1508243529287-e21914733111?q=80&w=500&auto=format&fit=crop",
    height: 260,
    agree: 1760,
    oppose: 220,
    status: 0
  },
  {
    id: 15,
    title: "穿衣自由有限度吗",
    content: "我们可以随心所欲地穿任何喜欢的衣服吗？还是穿衣也需要分场合、分环境，甚至要考虑他人的视觉感受？有人认为身体是自己的，穿什么是最高人权；也有人主张穿衣是一种社会语言，需要符合特定的礼仪和公序良俗。在自我表达与社会规范之间，穿衣自由的边界到底在哪里？",
    image: "https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=500&auto=format&fit=crop",
    height: 280,
    agree: 1980,
    oppose: 450,
    status: 0
  },
  {
    id: 16,
    title: "网红生活是真实的吗",
    content: "在朋友圈和社交平台上展示的精致生活，背后究竟是真实的快乐，还是为了获取点赞和流量而精心策划的视觉碎片？我们被困在精致的滤镜里，不断地与他人的“高光时刻”进行比较，从而产生深深的焦虑。这种虚构的完美正在如何重塑我们的生活观和幸福感？你更向往虚幻的精致还是粗糙的真实？",
    image: "https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?q=80&w=500&auto=format&fit=crop",
    height: 240,
    agree: 320,
    oppose: 2400,
    status: 0
  },
  {
    id: 17,
    title: "极简主义让快乐吗",
    content: "断舍离是通往心灵自由的捷径，还是对丰富生活的自我限制？少即是多（Less is More）的哲学在物欲横流的时代显得尤为冷静。有人通过精简物品找到了生活的重点，摆脱了束缚；也有人认为这种生活方式过于刻意和冷感，丢失了生活的烟火气和记忆的承载。你会选择清爽的留白，还是丰盛的拥挤？",
    image: "https://images.unsplash.com/photo-1505691723518-36a5ac3be353?q=80&w=500&auto=format&fit=crop",
    height: 290,
    agree: 1340,
    oppose: 460,
    status: 0
  },
  {
    id: 18,
    title: "自律是为了谁",
    content: "坚持健身、学习、早起，这些自律行为的背后，究竟是为了遇见更好的自己，还是因为害怕被时代抛弃而产生的同辈压力？真正的自律应该是内心驱动的，还是在他人审视下的自我表演？当我们把生活排满日程表时，我们是在掌握生活，还是在被某种社会标准奴役？你的自律里有快乐吗？",
    image: "https://images.unsplash.com/photo-1434494878577-86c23bcb06b9?q=80&w=500&auto=format&fit=crop",
    height: 310,
    agree: 1560,
    oppose: 670,
    status: 0
  },
  {
    id: 19,
    title: "社交恐惧是病吗",
    content: "在这个过度连接的世界，拒绝无效社交是否成了一种奢侈？不想和陌生人说话、害怕接电话、在人群中感到不适，这究竟是性格的内向，还是当代人的一种自我防御机制？我们正在丧失面对面交流的能力，还是在通过孤独来保护自己的精神内耗？如果社交让你痛苦，你是否有权利选择沉默？",
    image: "https://images.unsplash.com/photo-1515378960530-7c0da6231fb1?q=80&w=500&auto=format&fit=crop",
    height: 270,
    agree: 1780,
    oppose: 230,
    status: 0
  },
  {
    id: 20,
    title: "家务分配公平吗",
    content: "家庭内部的劳动分工，往往是性别不平等的隐形战场。家务事应该是男女绝对对等的分担，还是应该根据经济贡献、工作强度来“能者多劳”？很多时候，即使女性在职场同样出色，回到家依然承担了大部分的情感劳动和琐碎杂事。你认为实现真正的家庭公平，最关键的因素是什么？",
    image: "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=500&auto=format&fit=crop",
    height: 330,
    agree: 2200,
    oppose: 140,
    status: 0
  },
  {
    id: 21,
    title: "冠姓权重要吗",
    content: "孩子跟随父姓是千年不变的血缘传承，还是父权社会的残余影响？随着女性自我意识的觉醒，越来越多的年轻父母开始在孩子的姓氏上产生分歧。这究竟是一个面子问题，还是一个关乎尊严和家庭地位的原则问题？如果孩子随母姓，我们的社会心理准备好了吗？这种争夺会影响家庭的稳定吗？",
    image: "https://images.unsplash.com/photo-1555252333-9f8e92e65df9?q=80&w=500&auto=format&fit=crop",
    height: 300,
    agree: 1100,
    oppose: 1300,
    status: 0
  },
  {
    id: 22,
    title: "催婚是一种伤害吗",
    content: "父母的催促往往打着“爱与关怀”的旗号，但对子女而言，这可能是一种无形的心理霸凌。催婚不仅否定了子女当下的生活价值，更传递出一种“只有结婚才算圆满”的单一幸福观。当亲情变成了压力，该如何沟通才能既保护家人的感情，又捍卫自己的生活自主权？被催婚的你，选择了妥协还是战斗？",
    image: "https://images.unsplash.com/photo-1484981138541-3d074aa97716?q=80&w=500&auto=format&fit=crop",
    height: 340,
    agree: 2500,
    oppose: 180,
    status: 0
  },
  {
    id: 23,
    title: "现代育儿焦虑吗",
    content: "精英式教育、各种兴趣班、不能输在起跑线上……现代育儿已经变成了一场旷日持久的军备竞赛。我们在剥夺孩子童年的同时，是否也在榨干父母最后的一丝精力？这种焦虑来自于对孩子未来的真实关怀，还是家长在社会竞争中的虚荣心外化？我们该如何找回那种简单、快乐、自然的养育方式？",
    image: "https://images.unsplash.com/photo-1473625247510-8ceb1760943f?q=80&w=500&auto=format&fit=crop",
    height: 280,
    agree: 1980,
    oppose: 320,
    status: 0
  },
  {
    id: 24,
    title: "性别刻板印象还在吗",
    content: "为什么女孩就该文静、擅长文科，而男孩就该勇敢、擅长逻辑？虽然社会在进步，但这些细微的刻板印象依然潜伏在玩具店、职场招聘和家庭教育中。这些标签不仅限制了个人潜力的发挥，更塑造了不平等的人格。我们该如何打破这些隐形的天花板，让每个人都能自由地活出自我，不分性别？",
    image: "https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?q=80&w=500&auto=format&fit=crop",
    height: 260,
    agree: 2150,
    oppose: 120,
    status: 0
  },
  {
    id: 25,
    title: "公开恋情有必要吗",
    content: "朋友圈公开是给对方的安全感和承诺，还是幼稚的占有欲和社交炫耀？有些人认为不公开就是在留备胎，是感情不坚定的表现；有些人则主张恋爱是两个人的私事，不需要展示给外人看，低调反而能走得更久。在虚拟世界的“官宣”文化中，你的爱情观是什么？公开与否是否等同于爱的深度？",
    image: "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?q=80&w=500&auto=format&fit=crop",
    height: 290,
    agree: 920,
    oppose: 1100,
    status: 0
  },
  {
    id: 26,
    title: "精神寄托靠宠物吗",
    content: "养猫养狗已经成为了现代都市人逃避社交冷感、寻求情感慰藉的出口。宠物的陪伴是无条件的、治愈的，但这种代偿性质的情感，能否真正填补人与人之间真实的亲密感缺失？我们是因为人类太复杂才转向宠物吗？当宠物成为了家庭成员，我们对“亲人”的定义是否正在发生微妙的变化？",
    image: "https://images.unsplash.com/photo-1450778869180-41d0601e046e?q=80&w=500&auto=format&fit=crop",
    height: 240,
    agree: 1890,
    oppose: 430,
    status: 0
  },
  {
    id: 27,
    title: "晚婚晚育是趋势吗",
    content: "越成熟越难爱上一个人，越有事业心越觉得养孩子太难。晚婚晚育是现代女性对人生更稳健、更负责的选择，还是在错失了生理和精力上的最佳时机后的无奈妥协？当“单身力”成为了独立女性的标配，婚姻和育儿在人生清单中的位置是否正在悄然下降？你会在什么样的情况下决定走进婚姻？",
    image: "https://images.unsplash.com/photo-1515934751635-c81c6bc9a2d8?q=80&w=500&auto=format&fit=crop",
    height: 310,
    agree: 1650,
    oppose: 780,
    status: 0
  },
  {
    id: 28,
    title: "全职奶爸会被歧视吗",
    content: "当女性在外打拼事业，男性选择回归家庭照顾子女，我们的社会对这种“女主外男主内”的模式依然带有某种偏见。全职奶爸被贴上“没出息”的标签，这种压力既来自外界，也可能来自他内心的认同。打破性别分工的刻板印象，支持多元化的家庭模式，我们的社会心理真的准备好了吗？",
    image: "https://images.unsplash.com/photo-1542044896530-05d85be9b11a?q=80&w=500&auto=format&fit=crop",
    height: 270,
    agree: 1420,
    oppose: 670,
    status: 0
  },
  {
    id: 29,
    title: "追星是虚度光阴吗",
    content: "粉丝对偶像的情感投入，被许多人视为单向的幻象和时间的浪费。但从另一个角度看，追星提供了一种精神共鸣、一种对美好品质的追求以及一个志同道合的社交圈。这种力量能否转化成现实生活中的进取心？追星究竟是成年人的避难所，还是迷失自我的沼泽？你的偶像曾给你带来过力量吗？",
    image: "https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?q=80&w=500&auto=format&fit=crop",
    height: 330,
    agree: 760,
    oppose: 1540,
    status: 0
  },
  {
    id: 30,
    title: "消费能买到快乐吗",
    content: "刷卡那一瞬间的快感确实真实，但它解决的是生活中的实际短缺，还是内心的匮乏与空虚？多巴胺式的消费往往伴随着过后的空虚，而真正持久的快乐似乎并不来自于拥有物品的数量。在买买买的循环中，我们是否已经忘记了如何通过创造、阅读和深度沟通来获得高质量的幸福？你的快乐成本有多高？",
    image: "https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=500&auto=format&fit=crop",
    height: 250,
    agree: 1100,
    oppose: 1450,
    status: 0
  },
  {
    id: 31,
    title: "手机依赖症如何拯救",
    content: "我们是在使用手机，还是被手机囚禁了？放下屏幕后产生的巨大空虚感，说明我们已经失去了感知现实世界的能力。社交媒体上的碎信息切断了我们的逻辑思维，短视频的快感剥夺了我们的耐心。我们该如何找回深度阅读、真实社交和静坐沉思的能力？放下手机，你还能找回真正的自己吗？",
    image: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=500&auto=format&fit=crop",
    height: 300,
    agree: 2300,
    oppose: 120,
    status: 0
  },
  {
    id: 32,
    title: "独立女性需要婚姻吗",
    content: "当经济独立、精神富足成为现代女性的追求，婚姻不再是生存的必需品，而成了一个可选项。如果婚姻不能提供1+1>2的价值，如果它成了一种对个人发展的阻碍和自由的牺牲，我们为什么还要选择它？独立女性是更难在婚姻中获得幸福，还是拥有了随时离开、重新定义幸福的选择权？",
    image: "https://images.unsplash.com/photo-1469334031218-e382a71b716b?q=80&w=500&auto=format&fit=crop",
    height: 320,
    agree: 1450,
    oppose: 890,
    status: 0
  },
  {
    id: 33,
    title: "身体正向审美与自信",
    content: "追求极致的“白幼瘦”究竟是个人对美的自由向往，还是在资本和社交媒体合谋下的审美霸凌？每一个毛孔、每一处纹路都被审判，让我们陷入了无穷的自我厌恶。我们该如何学会接纳身体的不完美，将它看作是生命轨迹的见证？真正的审美自信，是敢于打破单一标签，拥抱多元且真实的自己。",
    image: "https://images.unsplash.com/photo-1515023115689-589c33041d3c?q=80&w=500&auto=format&fit=crop",
    height: 310,
    agree: 2100,
    oppose: 230,
    status: 0
  },
  {
    id: 34,
    title: "成年人的友谊需要经营吗",
    content: "渐渐不再联系的好友，是顺其自然的筛选，还是因为我们疏于表达、懒于刻意维持？成年人的世界里，每个人都忙着赶路，友谊似乎成了一件奢侈的易碎品。但如果一段感情不需要经营，那它最终只能沦为泛泛之交。你认为真正的友谊是经得起长久沉默的默契，还是需要高频互动的“并肩作战”？",
    image: "https://images.unsplash.com/photo-1543807535-eceef0bc6599?q=80&w=500&auto=format&fit=crop",
    height: 280,
    agree: 1760,
    oppose: 450,
    status: 0
  },
  {
    id: 35,
    title: "女性独自旅行的意义",
    content: "一个人出发是危险的冒险，还是找回自我的必经之路？独自旅行让女性脱离了日常身份的束缚，去面对未知的风景与人，也在解决困难中重新发现了自己的力量。在这个过程中，学会与孤独相处，学会独立决策，每一公里都是对勇气的加冕。你敢开启一场完全属于自己的、说走就走的旅程吗？",
    image: "https://images.unsplash.com/photo-1503220317375-aaad61436b1b?q=80&w=500&auto=format&fit=crop",
    height: 340,
    agree: 1920,
    oppose: 130,
    status: 0
  },
  {
    id: 36,
    title: "存款多少才有安全感",
    content: "在这个充满变数的时代，活在当下的及时行乐重要，还是通过不断累积存款来抵御未来的风险更明智？存款数字的跳动不仅是金钱的增加，更是心理防线的加固。但当节约变成了吝啬，当为了攒钱而牺牲了当下的生活质量，安全感是否变成了一种负担？你认为人一生中，多少存款才能支撑起真正的自由？",
    image: "https://images.unsplash.com/photo-1579621909532-3d074aa97716?q=80&w=500&auto=format&fit=crop",
    height: 250,
    agree: 1870,
    oppose: 340,
    status: 0
  },
  {
    id: 37,
    title: "事业与生育的时间线",
    content: "女性的最佳生育年龄与职场上升的关键期往往高度重合。这是一个残酷的二选一难题，还是社会系统对女性的一种天然压榨？我们能否通过社会政策、职场环境的改变，让生育不再成为事业的“绊脚石”？在这种时间赛跑中，选择卵子冷冻是缓解焦虑的灵药，还是对残酷现实的被动买单？",
    image: "https://images.unsplash.com/photo-1581579438747-104c53d7fbc4?q=80&w=500&auto=format&fit=crop",
    height: 315,
    agree: 1560,
    oppose: 420,
    status: 0
  },
  {
    id: 38,
    title: "社交媒体与自我价值",
    content: "我们的自尊心是否已经被点赞数、评论数和粉丝数所绑架？在精心设计的完美人设背后，那个焦虑、脆弱、真实的自我该往何处躲藏？社交媒体提供了一个展示窗，但也变成了一个无形的竞技场。如何在虚拟的欢呼声中保持清醒，不让外在的评价定义自己的价值，这是每个当代女性的必修课。",
    image: "https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?q=80&w=500&auto=format&fit=crop",
    height: 260,
    agree: 540,
    oppose: 1980,
    status: 0
  },
  {
    id: 39,
    title: "家务劳动的经济价值",
    content: "如果家务劳动能够明码标价，社会对家庭主妇的认同感是否会大幅提升？长期以来，女性在家庭中的付出被视为“分内事”而遭到忽视。承认家务的生产力价值，不仅是法律的进步，更是社会观念的矫正。当劳动的汗水在厨房被看见，当照顾的行为在客厅被尊重，两性关系才可能迎来真正的平等。",
    image: "https://images.unsplash.com/photo-1556911220-e15b29be8c8f?q=80&w=500&auto=format&fit=crop",
    height: 325,
    agree: 2340,
    oppose: 110,
    status: 0
  },
  {
    id: 40,
    title: "科技领域的女性力量",
    content: "打破“女性不擅长理科”的千年偏见，在代码、算法和逻辑的严苛世界里，女性正在扮演着越来越关键的角色。细腻的视角、卓越的协调能力和敏锐的洞察力，正在赋予技术更多的人性与温度。未来的数字化世界，不应只有一种性别定义规则。支持女性学习编程与科学，就是支持人类更全面的创新。",
    image: "https://images.unsplash.com/photo-1531482615713-2afd69097998?q=80&w=500&auto=format&fit=crop",
    height: 300,
    agree: 1870,
    oppose: 140,
    status: 0
  },
  {
    id: 41,
    title: "共情能力是职场软肋吗",
    content: "女性天生的敏感与共情，在职场中常常被误解为“感情用事”或不够职业。但随着管理观念的进化，同理心、沟通力和协作力正在成为领导力的核心。这种“软实力”是解决冲突的良药，还是在做出冷酷决策时的累赘？我们是否应该在保持专业的同时，也保留那份能理解他人疾苦的珍贵直觉？",
    image: "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?q=80&w=500&auto=format&fit=crop",
    height: 310,
    agree: 1450,
    oppose: 560,
    status: 0
  },
  {
    id: 42,
    title: "精致生活VS过度包装",
    content: "我们是在享受一种高质量的生活方式，还是在为了维持“精致”的人设而疲于奔命？在消费主义的包装下，每一个生活瞬间都被商业化，从露营装备到下午茶餐盘，处处充满了比较。这种精致是内心的宁静，还是给别人看的虚假繁荣？学会在简陋中发现美，在繁华中保持朴素，或许才是真精致。",
    image: "https://images.unsplash.com/photo-1505691723518-36a5ac3be353?q=80&w=500&auto=format&fit=crop",
    height: 295,
    agree: 890,
    oppose: 1670,
    status: 0
  },
  {
    id: 43,
    title: "心理咨询的普及化",
    content: "看心理医生不再是一件羞耻的事情。当生活压力、职场焦虑和情感创伤让我们过载，学会向外界寻求专业的帮助，是一种成熟的自我拯救。心理咨询不是为了“修好”一个坏掉的人，而是为了帮助我们理清乱麻、找回内心的力量。在关爱身体的同时，我们的心理健康更需要一次深度的“体检”。",
    image: "https://images.unsplash.com/photo-1527137342181-19aab11a8ee1?q=80&w=500&auto=format&fit=crop",
    height: 285,
    agree: 2100,
    oppose: 120,
    status: 0
  },
  {
    id: 44,
    title: "终身学习的现实意义",
    content: "学历只是踏入社会的入场券，而终身学习才是保持长久竞争力的发动机。在这个AI高速迭代的时代，女性如何通过持续阅读、跨界学习和职场进修，保持自我的更新频率？学习不是为了获得证书，而是为了在面对未知的挑战时，依然拥有选择的自由和说“不”的底气。你今天学习了吗？",
    image: "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?q=80&w=500&auto=format&fit=crop",
    height: 305,
    agree: 2450,
    oppose: 80,
    status: 0
  },
  {
    id: 45,
    title: "原生家庭的羁绊与独立",
    content: "我们是在不自觉地复刻父母的人生剧本，还是在叛逆中寻找真正的自我？原生家庭带来的阴影与偏见，往往像遗传病一样伴随一生。如何与过去告别，如何建立健康的亲密边界，如何在理解父母的同时也学会原谅那个受伤的自己，这是我们步入成年的第一课。你已经完成了与家庭的精神切割吗？",
    image: "https://images.unsplash.com/photo-1517048676732-d65bc937f952?q=80&w=500&auto=format&fit=crop",
    height: 320,
    agree: 1890,
    oppose: 540,
    status: 0
  },
  {
    id: 46,
    title: "丁宠家庭的伦理与情感",
    content: "用养宠物代替生育后代，这种“毛孩子”带来的情感回馈，能否填补传统家庭中孩子的位置？对于很多丁克女性而言，宠物是忠诚的伙伴，也是情感的出口。这种选择不仅挑战了传统传宗接代的伦理，也反映了现代女性对家庭责任和情感契约的新理解。你认为这种跨物种的“亲情”是认真的吗？",
    image: "https://images.unsplash.com/photo-1450778869180-41d0601e046e?q=80&w=500&auto=format&fit=crop",
    height: 245,
    agree: 1230,
    oppose: 890,
    status: 0
  },
  {
    id: 47,
    title: "可持续时尚的未来",
    content: "快时尚正在以环境破坏为代价满足我们的虚荣心。我们能否通过旧衣改造、二手交易和租衣服务，在追求美的同时减少对地球的剥夺？可持续时尚不仅是一种消费趋势，更是一种生活态度：买得更少，买得更好。当每一件衣服背后都带有对自然和劳动的尊重，美才会变得更有尊严。",
    image: "https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?q=80&w=500&auto=format&fit=crop",
    height: 335,
    agree: 1560,
    oppose: 210,
    status: 0
  },
  {
    id: 48,
    title: "斜杠青年的副业探索",
    content: "主业求生存，副业求发展。在这个斜杠时代，女性如何在保证本职工作的同时，利用自己的兴趣爱好——如写作、插画、摄影或整理——开辟出属于自己的第二增长曲线？副业带来的不仅是经济收入，更是对职业天花板的一种勇敢试探。在多元身份的切换中，你是否找到了那个更精彩的自己？",
    image: "https://images.unsplash.com/photo-1499750310107-5fef28a66643?q=80&w=500&auto=format&fit=crop",
    height: 265,
    agree: 1780,
    oppose: 340,
    status: 0
  },
  {
    id: 49,
    title: "传统文化的现代演绎",
    content: "旗袍的优雅、汉服的仙气、新中式的利落。传统元素如何融入现代女性的日常穿搭，不仅是视觉的碰撞，更是文化根脉的觉醒。当年轻一代开始主动寻找古法工艺、穿着民族服饰走上街头，那份源自血液的审美自信正在重塑中国女性的时尚话语权。你最喜欢哪一种中国风的表达方式？",
    image: "https://images.unsplash.com/photo-1508243529287-e21914733111?q=80&w=500&auto=format&fit=crop",
    height: 290,
    agree: 2100,
    oppose: 150,
    status: 0
  },
  {
    id: 50,
    title: "幸福的终极定义",
    content: "是世俗意义上的阶层跨越、成功事业，还是内心的平静、自我的富足？幸福不是一个终点，而是一个感知当下的过程。每个女性心中都有自己的终极答案：有人追求远方的星辰大海，有人守候近处的烟火生活。当你学会不向外界索要认可，当你能够坦然拥抱自我的时刻，幸福或许已在其中。",
    image: "https://images.unsplash.com/photo-1493612276216-ee3925520721?q=80&w=500&auto=format&fit=crop",
    height: 310,
    agree: 2600,
    oppose: 100,
    status: 0
  }
];

class WaterFlowDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private dataArray: LiveDiscovery[] = [];

  totalCount(): number {
    return this.dataArray.length;
  }

  getData(index: number): LiveDiscovery {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  public addData(items: LiveDiscovery[]): void {
    this.dataArray = this.dataArray.concat(items);
    this.notifyDataReload();
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }
}

export { LiveDiscovery,WaterFlowDataSource,liveDiscoveryDate }

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
      "https://images.unsplash.com/photo-1541480601022-2308c0f02487?q=80&w=600"
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
      "https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?q=80&w=600"
    ],
    head: "急救篇",
    content: "烫伤冷水冲，至少持续15分钟降温，严禁涂抹牙膏或酱油。气道梗阻海姆立克，利用腹部冲击产生的气流将异物排出。动物咬伤要冲洗，用流动肥皂水和大量清水交替冲洗15分钟并及时就医。癫痫发作防误吸，保持侧卧位，移开周围危险物品，切勿往口中塞入硬物或过度按压四肢！"
  },
  {
    id: util.generateRandomUUID(true),
    images: [
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