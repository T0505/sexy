class EventUtil {

  private static instance: EventUtil;
  private map: Map<string, Function[]>;

  private constructor() {
    this.map = new Map();
  }

  public static getInstance(): EventUtil {
    if (!EventUtil.instance) {
      EventUtil.instance = new EventUtil();
    }
    return EventUtil.instance;
  }


  on(name: string, callback: Function): void {
    if (!this.map.has(name)) {
      this.map.set(name, []);
    }
    this.map.get(name)!.push(callback);
  }

  emit<T>(name: string, ...args: T[]): void {
    if (this.map.has(name)) {
      this.map.get(name)!.forEach((callback) => {
        callback(...args);
      });
    }
  }


  off(name: string, callback: Function): void {
    if (this.map.has(name)) {
      const callbacks = this.map.get(name)!;
      const index = callbacks.findIndex((cb) => cb === callback);
      if (index !== -1) {
        callbacks.splice(index, 1);
        if (callbacks.length === 0) {
          this.map.delete(name);
        }
      }
    }
  }
}

export default EventUtil.getInstance();