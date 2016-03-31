class MarsRover {

  private static let FORWARD_COMMAND: Character = "F";
  private static let BACKWARD_COMMAND: Character = "B";
  private static let LEFT_COMMAND: Character = "L";
  private static let RIGHT_COMMAND: Character = "R";

  private let actions: [Action]

  private var currentPosition: Position

  init(initialPosition: Position, actions: [Action] = [Action]()) {
    self.currentPosition = initialPosition
    self.actions = actions
  }

  func position() -> Point {
    return currentPosition.point
  }

  func lookingAt() -> Direction {
    return currentPosition.direction
  }

  func execute(input: String) {
    for inputCommand in input.characters {
      let command = Command(input: String(inputCommand), position: currentPosition)
      executeCommand(command)
    }
  }

  private func executeCommand(command: Command) {
    for action in actions {
      if (action.canExecute(command)) {
        currentPosition = action.execute(command)
      }
    }
  }

}