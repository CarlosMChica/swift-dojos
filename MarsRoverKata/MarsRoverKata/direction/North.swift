class North: Direction, Equatable {

  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet
  }

  func moveForward(point: Point) throws -> Point {
    return try planet.moveNorth(point)
  }

  func moveBackward(point: Point) throws -> Point {
    return try planet.moveSouth(point)
  }

  func turnLeft() -> Direction {
    return West(planet: planet)
  }

  func turnRight() -> Direction {
    return East(planet: planet)
  }

  var description: String {
    return "North"
  }

}

func ==(lhs: North, rhs: North) -> Bool {
  return true
}