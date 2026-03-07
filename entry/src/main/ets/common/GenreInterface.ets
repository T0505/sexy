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
  callback: () => void;
}
export interface BaseResponse<T> {
  code: number;
  message: string;
  data: T;
}