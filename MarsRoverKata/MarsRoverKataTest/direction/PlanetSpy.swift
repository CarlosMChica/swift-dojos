class PlanetSpy: Planet {

  var moveSouthCalled = false
  var moveNorthCalled = false
  var moveEastCalled = false
  var moveWestCalled = false

  override func moveSouth(point: Point) throws -> Point {
    moveSouthCalled = true
    return try super.moveSouth(point)
  }

  override func moveNorth(point: Point) throws -> Point {
    moveNorthCalled = true
    return try super.moveNorth(point)
  }

  override func moveEast(point: Point) throws -> Point {
    moveEastCalled = true
    return try super.moveEast(point)
  }

  override func moveWest(point: Point) throws -> Point {
    moveWestCalled = true
    return try super.moveWest(point)
  }

}
