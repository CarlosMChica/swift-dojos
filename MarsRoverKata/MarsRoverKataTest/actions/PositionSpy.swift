class PositionSpy: Position {

  var moveForwardCalled = false
  var moveBackwardCalled = false
  var turnLeftCalled = false
  var turnRightCalled = false

  init() {
    super.init(point: Point(), direction: DirectionSpy())
  }

  override func moveForward() -> Position {
    moveForwardCalled = true
    return super.moveForward()
  }

  override func moveBackward() -> Position {
    moveBackwardCalled = true
    return super.moveBackward()
  }

  override func turnLeft() -> Position {
    turnLeftCalled = true
    return super.turnLeft()
  }

  override func turnRight() -> Position {
    turnRightCalled = true
    return super.turnRight()
  }

}
