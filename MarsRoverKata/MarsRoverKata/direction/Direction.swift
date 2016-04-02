protocol Direction: CustomStringConvertible {

  func moveForward(point: Point) throws -> Point

  func moveBackward(point: Point) throws  -> Point

  func turnLeft() throws  -> Direction

  func turnRight() throws  -> Direction

}