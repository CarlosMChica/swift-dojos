class MarsRover {

  private static let FORWARD_COMMAND: Character = "F";
  private static let BACKWARD_COMMAND: Character = "B";
  private static let LEFT_COMMAND: Character = "L";
  private static let RIGHT_COMMAND: Character = "R";

  private var direction: Direction
  private var currentPoint: Point

  init(initialPoint: Point, initialDirection: Direction) {
    self.currentPoint = initialPoint
    self.direction = initialDirection
  }

  func position() -> Point {
    return currentPoint
  }

  func lookingAt() -> Direction {
    return direction
  }

  func execute(commands: String) {
    for command in Array(commands.characters) {
      execute(command)
    }
  }

  private func execute(command: Character) {
    switch command {
    case MarsRover.FORWARD_COMMAND:
      currentPoint = direction.moveForward(currentPoint)
    case MarsRover.BACKWARD_COMMAND:
      currentPoint = direction.moveBackward(currentPoint)
    case MarsRover.LEFT_COMMAND:
      direction = direction.turnLeft()
    case MarsRover.RIGHT_COMMAND:
      direction = direction.turnRight()
    default:
      break
    }
  }

}