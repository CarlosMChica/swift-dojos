class MoveBackwardAction: Action {

  static let commandInput = "B"

  func canExecute(command: Command) -> Bool {
    return command.input == MoveBackwardAction.commandInput
  }

  func execute(command: Command) -> Position {
    return command.position.moveBackward()
  }

}
