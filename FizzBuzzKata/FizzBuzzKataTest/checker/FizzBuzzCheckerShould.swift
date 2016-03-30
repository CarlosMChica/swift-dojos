import XCTest

class FizzBuzzCheckerShould: XCTestCase {

  private static let OUTPUT = "FizzBuzzOutput"
  private static let NUMBER = 0

  let checker = FizzBuzzChecker(fizzChecker: FizzChecker(),
      buzzChecker: BuzzChecker(),
      formatter: OutputFormatterStub(content: FizzBuzzCheckerShould.OUTPUT))

  func testGivenFizzBuzzNumber_whenCheck_thenReturnTrue() {
    assertFizzBuzzNumber(15)
    assertFizzBuzzNumber(30)
    assertFizzBuzzNumber(45)
    assertFizzBuzzNumber(60)
  }

  func testGivenNonFizzBuzzNumber_whenCheck_thenReturnFalse() {
    assertNonFizzBuzzNumber(1)
    assertNonFizzBuzzNumber(2)
    assertNonFizzBuzzNumber(3)
    assertNonFizzBuzzNumber(4)
    assertNonFizzBuzzNumber(5)
    assertNonFizzBuzzNumber(6)
    assertNonFizzBuzzNumber(7)
    assertNonFizzBuzzNumber(8)
    assertNonFizzBuzzNumber(9)
    assertNonFizzBuzzNumber(10)
    assertNonFizzBuzzNumber(11)
    assertNonFizzBuzzNumber(12)
    assertNonFizzBuzzNumber(13)
    assertNonFizzBuzzNumber(14)
    assertNonFizzBuzzNumber(16)
    assertNonFizzBuzzNumber(17)
    assertNonFizzBuzzNumber(18)
    assertNonFizzBuzzNumber(19)
    assertNonFizzBuzzNumber(20)
  }

  func testGivenANumber_whenGenerateOuput_thenReturnFormattedOutput() {
    let output = checker.generateOutput(FizzBuzzCheckerShould.NUMBER)

    XCTAssertEqual(output, FizzBuzzCheckerShould.OUTPUT)
  }

  func testOutputFormatter() {
    let formatter = FizzBuzzFormatter()

    XCTAssertEqual(FizzBuzzFormatter.OUTPUT, formatter.format())
  }

  func assertFizzBuzzNumber(number: Int) {
    XCTAssertTrue(checker.check(number))
  }

  func assertNonFizzBuzzNumber(number: Int) {
    XCTAssertFalse(checker.check(number))
  }

}
