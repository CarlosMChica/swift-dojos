public protocol Checker {

  func check(number: Int) -> Bool

  func generateOutput(number: Int) -> String

}

extension Checker {

  func isDivisibleBy(number: Int, dividend: Int) -> Bool {
    return number % dividend == 0
  }
}
