public class FizzBuzzPrinter {

  private let checkers: [Checker]
  private let view: View
  private let separator: String

  init(checkers: [Checker], view: View, separator: String = " ") {
    self.checkers = checkers
    self.view = view
    self.separator = separator
  }

  func print(number: Int) {
    print(generateOutput(number))
  }

  func print(numbers: Range<Int>) {
    print(Array(numbers))
  }

  func print(numbers: [Int]) {
    print(generateOutputs(numbers))
  }

  private func generateOutputs(numbers: [Int]) -> String {
    var output = ""
    for var i = 0; i < numbers.count; ++i {
      output += generateOutput(numbers, index: i)
    }
    return output
  }

  private func generateOutput(number: Int) -> String {
    for checker in checkers {
      if (checker.check(number)) {
        return checker.generateOutput(number)
      }
    }
    return ""
  }

  private func generateOutput(numbers: [Int], index: Int) -> String {
    var output = generateOutput(numbers[index])
    if (index < numbers.count - 1) {
      output.appendContentsOf(separator)
    }
    return output
  }

  private func print(content: String) {
    view.print(content)
  }

}
