class DirectionSpy: Direction {

  var moveForwardCalled = false
  var moveBackwardCalled = false
  var turnLeftCalled = false
  var turnRightCalled = false

  func moveForward(point: Point) -> Point {
    moveForwardCalled = true
    return Point()
  }

  func moveBackward(point: Point) -> Point {
    moveBackwardCalled = true
    return Point()
  }

  func turnLeft() -> Direction {
    turnLeftCalled = true
    return self
  }

  func turnRight() -> Direction {
    turnRightCalled = true
    return self
  }

  var description: String {
    return "DirectionSpy"
  }

}