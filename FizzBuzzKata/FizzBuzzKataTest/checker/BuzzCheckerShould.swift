import XCTest

class BuzzCheckerShould: XCTestCase {

  private static let OUTPUT = "BuzzOutput"
  private static let NUMBER = 0

  let checker = BuzzChecker(formatter: OutputFormatterStub(content: BuzzCheckerShould.OUTPUT))

  func testGivenBuzzNumber_whenCheck_thenReturnTrue() {
    assertBuzzNumber(5)
    assertBuzzNumber(10)
    assertBuzzNumber(15)
    assertBuzzNumber(20)
  }

  func testGivenNonFizzNumber_whenCheck_thenReturnFalse() {
    assertNonBuzzNumber(1)
    assertNonBuzzNumber(2)
    assertNonBuzzNumber(3)
    assertNonBuzzNumber(4)
    assertNonBuzzNumber(6)
    assertNonBuzzNumber(7)
    assertNonBuzzNumber(8)
    assertNonBuzzNumber(9)
  }

  func testGivenANumber_whenGenerateOuput_thenReturnFormattedOutput() {
    let output = checker.generateOutput(BuzzCheckerShould.NUMBER)

    XCTAssertEqual(output, BuzzCheckerShould.OUTPUT)
  }

  func testOutputFormatter() {
    let formatter = BuzzFormatter()

    XCTAssertEqual(BuzzFormatter.OUTPUT, formatter.format())
  }

  func assertBuzzNumber(number: Int) {
    XCTAssertTrue(checker.check(number))
  }

  func assertNonBuzzNumber(number: Int) {
    XCTAssertFalse(checker.check(number))
  }

}
