class DefaultChecker: Checker {

  private let formatter: OutputFormatter

  init(formatter: OutputFormatter = DefaultFormatter()) {
    self.formatter = formatter
  }

  func check(number: Int) -> Bool {
    return true
  }

  func generateOutput(number: Int) -> String {
    return formatter.format(number)
  }

}

class DefaultFormatter: OutputFormatter {
  func format(number: Int) -> String {
    return "\(number)"
  }
}