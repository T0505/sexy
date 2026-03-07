import { TabNav, TabsData } from '../common/DataList';
import Home from '../struction/Home';
import Profile from '../struction/Profile';
import Live from '../struction/Live';

@Builder
export function Factory() {
  Container();
}

@Component
struct Container {
  @State active: number = 0;
  @Provide stack: NavPathStack = new NavPathStack();
  @StorageProp("nav") nav: number = 0;

  build() {
    NavDestination() {
      Tabs({barPosition: BarPosition.End}) {
        ForEach(TabsData,(item: TabNav, index:number) => {
          TabContent() {
            Column() {
              if("首页" === item.title) {
                Home();
              }
              if("生活" === item.title) {
                Live();
              }
              if("我的" === item.title) {
                Profile()
              }
            }
          }
          .tabBar(this.TabBuilder(item,index));
        })
      }
      .barHeight(this.nav)
      .barBackgroundColor($r("app.color.bar_opacity"))
      .onChange((index:number) => {
        this.active = index;
      });
    }
    .backgroundColor($r("app.color.background_light"))
    .hideTitleBar(true)
    .hideToolBar(true)
    .onBackPressed(() => true)
    .onReady((context:NavDestinationContext) => {
      this.stack = context.pathStack
    });
  }


  @Builder
  TabBuilder(item: TabNav,index:number) {
    Column({space: 8}) {
      Image(index - this.active ? item.icon : item.active)
        .width(24);
      if(index === this.active) {
        Text(item.title)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor($r("app.color.main"));
      } else {
        Text(item.title)
          .fontSize(14)
          .fontWeight(FontWeight.Normal);
      }
    }
    .height(this.nav)
    .padding({top: 16})
    .width("100%")
  }
}