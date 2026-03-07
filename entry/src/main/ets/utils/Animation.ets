
export default class Animations {

  static slideInFromBottom(): AnimateParam {
    return {
      duration: 300,
      curve: Curve.EaseOut,
      playMode: PlayMode.Normal
    }
  }

  static slideInFromTop(): AnimateParam {
    return {
      duration: 300,
      curve: Curve.EaseOut,
      playMode: PlayMode.Normal
    }
  }

  static slideInFromLeft(): AnimateParam {
    return {
      duration: 300,
      curve: Curve.EaseOut,
      playMode: PlayMode.Normal
    }
  }

  static slideInFromRight(): AnimateParam {
    return {
      duration: 300,
      curve: Curve.EaseOut,
      playMode: PlayMode.Normal
    }
  }

  static fadeIn(): AnimateParam {
    return {
      duration: 300,
      curve: Curve.EaseInOut,
      playMode: PlayMode.Normal
    }
  }
}