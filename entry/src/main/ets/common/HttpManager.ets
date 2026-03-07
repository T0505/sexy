import axios, { AxiosInstance, AxiosResponse, AxiosError } from "@ohos/axios";
import { BaseResponse } from "../common/GenreInterface";

class HttpManager {
  private instance: AxiosInstance;

  constructor() {
    this.instance = axios.create({
      baseURL: "",
      timeout: 10000
    });

    this.instance.interceptors.response.use(
      (response: AxiosResponse) => {
        const res = response.data as BaseResponse<Object>;
        if (res.code === 200) {
          return response;
        } else {
          return Promise.reject(new Error(res.message));
        }
      },
      (error: AxiosError) => {
        return Promise.reject(error);
      }
    );
  }

  public get<T>(url: string, params?: Record<string, Object>): Promise<T> {
    return this.instance.get<T, AxiosResponse<BaseResponse<T>>>(url, { params })
      .then((res: AxiosResponse<BaseResponse<T>>) => res.data.data);
  }

  public post<T>(url: string, data?: Record<string, Object>): Promise<T> {
    return this.instance.post<T, AxiosResponse<BaseResponse<T>>>(url, data)
      .then((res: AxiosResponse<BaseResponse<T>>) => res.data.data);
  }

  public put<T>(url: string, data?: Record<string, Object>): Promise<T> {
    return this.instance.put<T, AxiosResponse<BaseResponse<T>>>(url, data)
      .then((res: AxiosResponse<BaseResponse<T>>) => res.data.data);
  }

  public delete<T>(url: string, params?: Record<string, Object>): Promise<T> {
    return this.instance.delete<T, AxiosResponse<BaseResponse<T>>>(url, { params })
      .then((res: AxiosResponse<BaseResponse<T>>) => res.data.data);
  }
}

export const http = new HttpManager();