class FizzChecker: Checker {

  private let formatter: OutputFormatter

  init(formatter: OutputFormatter = FizzFormatter()) {
    self.formatter = formatter
  }

  func check(number: Int) -> Bool {
    return isDivisibleBy(number, dividend: 3)
  }

  func generateOutput(number: Int) -> String {
    return formatter.format(number)
  }

}

class FizzFormatter: OutputFormatter {

  static let OUTPUT = "Fizz"

  func format(number: Int = 0) -> String {
    return FizzFormatter.OUTPUT
  }

}