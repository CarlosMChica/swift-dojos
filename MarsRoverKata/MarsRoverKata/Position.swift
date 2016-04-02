class Position: Equatable {

  let point: Point
  let direction: Direction

  init(point: Point, direction: Direction) {
    self.point = point
    self.direction = direction
  }

  func moveForward() throws -> Position {
    return try Position(point: direction.moveForward(point), direction: direction)
  }

  func moveBackward() throws -> Position {
    return try Position(point: direction.moveBackward(point), direction: direction)
  }

  func turnLeft() throws -> Position {
    return try Position(point: point, direction: direction.turnLeft())
  }

  func turnRight() throws -> Position {
    return try Position(point: point, direction: direction.turnRight())
  }

}

func ==(lhs: Position, rhs: Position) -> Bool {
  return lhs.point == rhs.point &&
      lhs.direction.dynamicType == rhs.direction.dynamicType
}

struct Point: Equatable, CustomStringConvertible {

  let x, y: Int

  init(x: Int = 0, y: Int = 0) {
    self.x = x
    self.y = y
  }

  var description: String {
    return "x = \(x), y = \(y)"
  }

}

func ==(lhs: Point, rhs: Point) -> Bool {
  return lhs.x == rhs.x && lhs.y == rhs.y
}