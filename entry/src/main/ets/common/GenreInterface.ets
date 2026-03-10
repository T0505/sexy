import { IAxisValueFormatter } from "@ohos/mpchart";
export interface TabNav {
  title:string;
  icon: ResourceStr;
  active: ResourceStr
}

export interface HeaderBack {
  id?:string;
  back:boolean;
}
export interface LinkUse {
  title:string;
  icon: ResourceStr;
  name?:string;
  url?: string;
}

export interface WebH5Type {
  title: string;
  url: string;
}

export interface Schedule {
  day:number;
  status: number;
}

export interface Vocation {
  color: Resource;
  title: string;
}

export interface HomeMethod {
  icon: Resource;
  title: string;
  callback?: () => void;
}
export interface BaseResponse<T> {
  code: number;
  message: string;
  data: T;
}

@Observed
export class Cartoon {
  opacity: number;
  enable: boolean;
  y: number;
  x: number;

  constructor(opacity: number = 0, enable: boolean = false, y: number = 100, x: number = 0) {
    this.opacity = opacity;
    this.enable = enable;
    this.y = y;
    this.x = x;
  }
}

@Observed
export class Daily extends Cartoon {
  id: string;
  name: string;
  date: Date;
  children: DailyRecord[];
  dailies: Daily[];

  constructor(id: string, name: string, date: Date = new Date(), children: DailyRecord[] = [], dailies: Daily[] = []) {
    super();
    this.id = id;
    this.name = name;
    this.date = date;
    this.children = children;
    this.dailies = dailies;
  }
}
@Observed
export class DailyRecord {
  id: string;
  title: string;
  content: string[];
  write_time: Date;

  constructor(id: string, title: string, content: string[], write_time: Date = new Date()) {
    this.id = id;
    this.title = title;
    this.content = content;
    this.write_time = write_time;
  }
}

export interface DiaryParam {
  record?: DailyRecord;
  folderId: string;
}

export function reconstruct(item: Daily): Daily {
  return new Daily(
    item.id,
    item.name,
    new Date(item.date),
    item.children ? item.children.map(c => new DailyRecord(c.id, c.title, c.content, new Date(c.write_time))) : [],
    item.dailies ? item.dailies.map((child: Daily) => reconstruct(child)) : []
  );
}

export function findById(root: Daily, id: string): Daily | null {
  if (root.id === id) return root;
  for (let child of root.dailies) {
    let found = findById(child, id);
    if (found) return found;
  }
  return null;
}

export interface TodayWeight {
  weight:string;
  date:Date;
}


export class DateFormatter implements IAxisValueFormatter {
  private dates: string[];
  constructor(dates: string[]) {
    this.dates = dates;
  }
  getFormattedValue(value: number): string {
    let index = Math.floor(value);
    if (index >= 0 && index < this.dates.length) {
      return this.dates[index];
    }
    return "";
  }
}

export interface DoctorAdvice {
  id:string;
  images:string[];
  head:string;
  content:string;
}

export interface CategoryItem {
  title: string;
  icon: string;
  color: string;
}

export interface KnowledgeData {
  title: string;
  tag: string;
  img: string;
  author: string;
}