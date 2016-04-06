class TestableClock: Clock {

  private let timestamp: CLong

  init(timestamp: CLong) {
    self.timestamp = timestamp
  }

  override func currentTimeInMillis() -> CLong {
    return timestamp
  }

}
