class Input: Equatable {

  private let input: String

  init(input: String) {
    self.input = input
  }

  func getParamAtPosition(position: Int) -> String {
    return input.characters.split(" ").map(String.init)[position]
  }
}

func ==(lhs: Input, rhs: Input) -> Bool {
  return lhs.input == rhs.input
}
