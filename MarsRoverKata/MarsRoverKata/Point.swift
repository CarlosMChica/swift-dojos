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