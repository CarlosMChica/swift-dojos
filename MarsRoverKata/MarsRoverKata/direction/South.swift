class South: Direction, Equatable {

  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet
  }

  func moveForward(point: Point) -> Point {
    return planet.moveSouth(point)
  }

  func moveBackward(point: Point) -> Point {
    return planet.moveNorth(point)
  }

  func turnLeft() -> Direction {
    return East(planet: planet)
  }

  func turnRight() -> Direction {
    return West(planet: planet)
  }

  var description: String {
    return "South"
  }

}

func ==(lhs: South, rhs: South) -> Bool {
  return true
}