class FizzBuzzChecker: Checker {

  private let fizzChecker: FizzChecker
  private let buzzChecker: BuzzChecker
  private let formatter: OutputFormatter

  init(fizzChecker: FizzChecker, buzzChecker: BuzzChecker, formatter: OutputFormatter = FizzBuzzFormatter()) {
    self.fizzChecker = fizzChecker
    self.buzzChecker = buzzChecker
    self.formatter = formatter
  }

  func check(number: Int) -> Bool {
    return fizzChecker.check(number) && buzzChecker.check(number)
  }

  func generateOutput(number: Int) -> String {
    return formatter.format(number)
  }

}

class FizzBuzzFormatter: OutputFormatter {

  static let OUTPUT = "FizzBuzz"

  func format(number: Int = 0) -> String {
    return FizzBuzzFormatter.OUTPUT
  }

}