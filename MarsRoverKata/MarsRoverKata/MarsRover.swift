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
      try executeCommand(command)
    }
  }

  private func executeCommand(command: Command) throws {
    for action in actions {
      if (action.canExecute(command)) {
        currentPosition = try action.execute(command)
        return
      }
    }
    throw RoverError.UnknownCommand(command: command.input)
  }

}

enum RoverError: ErrorType, Equatable {
  case UnknownCommand(command:String)
}

func ==(lhs: RoverError, rhs: RoverError) -> Bool {
  switch (lhs, rhs) {
  case (.UnknownCommand(let l), .UnknownCommand(let r)):
    return l == r
  }
}