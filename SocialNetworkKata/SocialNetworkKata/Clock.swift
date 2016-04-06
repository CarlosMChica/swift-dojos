import Foundation

class Clock {

  func currentTimeInMillis() -> CLong {
    return CLong(NSDate().timeIntervalSince1970 * 1000)
  }
}
