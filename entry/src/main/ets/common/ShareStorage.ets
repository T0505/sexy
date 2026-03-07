import { AppStorageV2 } from "@kit.ArkUI";

const stack:NavPathStack = AppStorageV2.connect(NavPathStack,"stack",() => new NavPathStack())!;

export {
  stack
}