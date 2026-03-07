import preferences from '@ohos.data.preferences';
import { common } from '@kit.AbilityKit';

const STORAGE_NAME = "REFERENCE";

async function getPrefer(context: common.UIAbilityContext) {
  try {
    return await preferences.getPreferences(context, STORAGE_NAME);
  } catch (e) {

    console.error("preferences init failure：", e);
    return null;
  }
}

export async function save(context: common.UIAbilityContext,key:string,value:Object) {
  const prefer = await getPrefer(context);
  if (!prefer) return false;
  try {

    prefer.put(key, JSON.stringify(value)).catch(() => {});
    await prefer.flush();
    return true;
  } catch (error) {
    return false;
  }
}

export async function get<T>(context: common.UIAbilityContext,key:string) {
  const prefer = await getPrefer(context);
  if (!prefer) return null;
  try {
    const json = await prefer.get(key, "") as string;

    if (!json) return null;

    return JSON.parse(json) as T;
  } catch (error) {
    return null;
  }
}

export async function remove(context: common.UIAbilityContext,key:string) {
  const prefer = await getPrefer(context);
  if (!prefer) return false;

  try {
    await prefer.flush();
    prefer.delete(key).catch(() => {});
    return true;
  } catch (error) {
    return false;
  }
}