class PositionSpy: Position {

  var moveForwardCalled = false
  var moveBackwardCalled = false
  var turnLeftCalled = false
  var turnRightCalled = false

  init() {
    super.init(point: Point(), direction: DirectionSpy())
  }

  override func moveForward() throws -> Position {
    moveForwardCalled = true
    return try super.moveForward()
  }

  override func moveBackward() throws -> Position {
    moveBackwardCalled = true
    return try super.moveBackward()
  }

  override func turnLeft() throws -> Position {
    turnLeftCalled = true
    return try super.turnLeft()
  }

  override func turnRight() throws -> Position {
    turnRightCalled = true
    return try super.turnRight()
  }

}
