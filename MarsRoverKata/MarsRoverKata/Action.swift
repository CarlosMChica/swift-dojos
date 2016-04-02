protocol Action {
  func canExecute(command: Command) -> Bool

  func execute(command: Command) throws -> Position
}

struct Command: Equatable {
  let input: String
  let position: Position

  init(input: String = "", position: Position) {
    self.input = input
    self.position = position
  }
}

func ==(lhs: Command, rhs: Command) -> Bool {
  return lhs.input == rhs.input && lhs.position == rhs.position
}

