import { AbilityStage } from "@kit.AbilityKit";
import { preInit, InternalPlugin, setLogEnabled } from "@umeng/analytics";

export default class UmAbilityStage extends AbilityStage {
  onCreate() {

    setLogEnabled(true);
    preInit({
      context: this.context.getApplicationContext(),
      plugins: [new InternalPlugin()]
    });
  }
}