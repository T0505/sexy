export default class DateUtil {

  static formatDate(dateParam: Date | string | number = new Date(), format: string = "yyyy-MM-dd"): string {
    const date = new Date(dateParam);

    if (isNaN(date.getTime())) {
      return "";
    }

    const config: Record<string, string> = {
      "yyyy": date.getFullYear().toString(),
      "MM": (date.getMonth() + 1).toString().padStart(2, "0"),
      "dd": date.getDate().toString().padStart(2, "0"),
      "HH": date.getHours().toString().padStart(2, "0"),
      "mm": date.getMinutes().toString().padStart(2, "0"),
      "ss": date.getSeconds().toString().padStart(2, "0"),
    };

    let result = format;
    const keys = Object.keys(config);
    for (let key of keys) {
      result = result.split(key).join(config[key]);
    }

    return result;
  }

  static getWeek(dateParam: Date | string | number = new Date()): string {
    const date = new Date(dateParam);
    const weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
    return weeks[date.getDay()];
  }

  static getTimestamp(): string {
    return new Date().getTime().toString();
  }
}