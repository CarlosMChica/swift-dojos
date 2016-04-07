import Foundation

struct Input: Equatable {

  private let argumentsSeparator: Character = " "
  private let input: String

  init(input: String) {
    self.input = input
  }

  func hasIdentifier(identifier: String) -> Bool {
    return input.containsString(identifier)
  }

  func hasSingleArgument() -> Bool {
    return !input.containsString(String(argumentsSeparator))
  }

  func getFirstArgument() -> String {
    return input.characters.split(argumentsSeparator).map(String.init)[0]
  }

  func getIdentifierArgument(identifier: String) -> String? {
    NSDate().timeIntervalSince1970
    let arguments = input.componentsSeparatedByString(identifier)
    return arguments.count > 1 ? arguments[1].trim() : nil
  }

}

func ==(lhs: Input, rhs: Input) -> Bool {
  return lhs.input == rhs.input
}

extension String {
  func trim() -> String {
    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  }
}
