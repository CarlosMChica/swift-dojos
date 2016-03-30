class West: Direction, Equatable {

  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet;
  }

  func moveForward(point: Point) -> Point {
    return planet.moveWest(point)
  }

  func moveBackward(point: Point) -> Point {
    return planet.moveEast(point)
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