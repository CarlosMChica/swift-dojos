class BuzzChecker: Checker {

  private let formatter: OutputFormatter

  init(formatter: OutputFormatter = BuzzFormatter()) {
    self.formatter = formatter
  }

  func check(number: Int) -> Bool {
    return isDivisibleBy(number, dividend: 5)
  }

  func generateOutput(number: Int) -> String {
    return formatter.format(number)
  }

}

class BuzzFormatter: OutputFormatter {

  static let OUTPUT = "Buzz"

  func format(number: Int = 0) -> String {
    return BuzzFormatter.OUTPUT
  }

}