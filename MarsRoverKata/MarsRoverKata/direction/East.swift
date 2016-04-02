class East: Direction, Equatable {

  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet
  }

  func moveForward(point: Point) throws -> Point {
    return try planet.moveEast(point)
  }

  func moveBackward(point: Point) throws -> Point {
    return try planet.moveWest(point)
  }

  func turnLeft() -> Direction {
    return North(planet: planet)
  }

  func turnRight() -> Direction {
    return South(planet: planet)
  }

  var description: String {
    return "East"
  }

}

func ==(lhs: East, rhs: East) -> Bool {
  return true
}
