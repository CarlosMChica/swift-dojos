class MarsRover {

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

  func execute(input: String) throws {
    for inputCommand in input.characters {
      let command = Command(input: String(inputCommand), position: currentPosition)
      try! executeCommand(command)
    }
  }

  private func executeCommand(command: Command) throws {
    var executed = false
    for action in actions {
      if (action.canExecute(command)) {
        currentPosition = action.execute(command)
        executed = true
      }
    }
    if (!executed) {
      throw RoverError.UnknownCommand(command: command.input)
    }
  }

}

enum RoverError: ErrorType {
  case UnknownCommand(command:String)
  case ObstacleFound(point:Point)
}

extension RoverError : Equatable {}

/// Implement the `==` operator as required by protocol `Equatable`.
func ==(lhs: RoverError, rhs: RoverError) -> Bool {
  switch (lhs, rhs) {
  case (.UnknownCommand(let l), .UnknownCommand(let r)):
    return l == r
  default:
    // We need a default case to return false for different case combinations.
    // By falling back to domain and code based comparison, we ensure that
    // as soon as we add additional error cases, we have to revisit only the
    // Equatable implementation, if the case has an associated value.
    return lhs._domain == rhs._domain
        && lhs._code   == rhs._code
  }
}