import { abilityAccessCtrl, bundleManager, common, Permissions } from "@kit.AbilityKit";

export async function achieve(context: common.UIAbilityContext,permissions:Permissions[]) {
  try {
    const manager = abilityAccessCtrl.createAtManager();

    await manager.requestPermissionsFromUser(context, permissions);

  } catch (error) {

  }
}


export async function refuse(permission:Permissions,context:common.UIAbilityContext,callback?:() => void) {
  const manager = abilityAccessCtrl.createAtManager();
  const bundle = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);

  const statue = await manager.checkAccessToken(bundle.appInfo.accessTokenId, permission).catch(() => {

  });
  if(statue === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED) {

    context?.startAbility({
      bundleName: "com.huawei.hmos.settings",
      abilityName: "com.huawei.hmos.settings.MainAbility",
      uri: "application_info_entry",
      parameters: {
        pushParams: bundle.name
      }
    }).catch(() => {

    });
  } else {
    if(callback) {
      callback();
    }
  }
}