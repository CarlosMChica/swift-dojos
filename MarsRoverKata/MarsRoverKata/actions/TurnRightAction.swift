class TurnRightAction: Action {

  static let commandInput = "R"

  func canExecute(command: Command) -> Bool {
    return command.input == TurnRightAction.commandInput
  }

  func execute(command: Command) -> Position {
    return command.position.turnRight()
  }

}
