class TestableClock: Clock {

  private let timestamps: [CLong]
  private var currentTimestamp = 0

  init(timestamps: [CLong]) {
    self.timestamps = timestamps
  }

  init(timestamp: CLong) {
    self.timestamps = [CLong](arrayLiteral: timestamp)
  }

  override func currentTimeInMillis() -> CLong {
    return timestamps[currentTimestamp++]
  }

}
