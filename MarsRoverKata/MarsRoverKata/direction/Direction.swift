protocol Direction: CustomStringConvertible {

  func moveForward(point: Point) -> Point

  func moveBackward(point: Point) -> Point

  func turnLeft() -> Direction

  func turnRight() -> Direction

}