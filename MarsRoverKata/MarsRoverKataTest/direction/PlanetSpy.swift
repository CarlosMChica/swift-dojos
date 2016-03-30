class PlanetSpy: Planet {

  var moveSouthCalled = false
  var moveNorthCalled = false
  var moveEastCalled = false
  var moveWestCalled = false

  override func moveSouth(point: Point) -> Point {
    moveSouthCalled = true
    return super.moveSouth(point)
  }

  override func moveNorth(point: Point) -> Point {
    moveNorthCalled = true
    return super.moveNorth(point)
  }

  override func moveEast(point: Point) -> Point {
    moveEastCalled = true
    return super.moveEast(point)
  }

  override func moveWest(point: Point) -> Point {
    moveWestCalled = true
    return super.moveWest(point)
  }

}
