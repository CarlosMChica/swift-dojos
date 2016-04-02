class MoveForwardAction: Action {

  static let commandInput = "F"

  func canExecute(command: Command) -> Bool {
    return command.input == MoveForwardAction.commandInput
  }

  func execute(command: Command) throws -> Position {
    return try command.position.moveForward()
  }

}
