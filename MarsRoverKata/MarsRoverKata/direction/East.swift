class East: Direction, Equatable {

  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet
  }

  func moveForward(point: Point) -> Point {
    return planet.moveEast(point)
  }

  func moveBackward(point: Point) -> Point {
    return planet.moveWest(point)
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
