class TurnLeftAction: Action {

  static let commandInput = "L"

  func canExecute(command: Command) -> Bool {
    return command.input == TurnLeftAction.commandInput
  }

  func execute(command: Command) throws -> Position {
    return try command.position.turnLeft()
  }

}
