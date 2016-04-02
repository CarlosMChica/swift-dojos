class West: Direction, Equatable {

  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet;
  }

  func moveForward(point: Point) throws -> Point {
    return try planet.moveWest(point)
  }

  func moveBackward(point: Point) throws -> Point {
    return try planet.moveEast(point)
  }

  func turnLeft() -> Direction {
    return South(planet: planet)
  }

  func turnRight() -> Direction {
    return North(planet: planet)
  }

  var description: String {
    return "West"
  }

}

func ==(lhs: West, rhs: West) -> Bool {
  return true
}