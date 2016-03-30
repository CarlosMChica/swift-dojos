import XCTest

class FizzCheckerShould: XCTestCase {

  private static let OUTPUT = "BuzzOutput"
  private static let NUMBER = 0

  let checker = FizzChecker(formatter: OutputFormatterStub(content: FizzCheckerShould.OUTPUT))


  func testGivenFizzNumber_whenCheck_thenReturnTrue() {
    assertFizzNumber(3)
    assertFizzNumber(6)
    assertFizzNumber(9)
    assertFizzNumber(12)
  }

  func testGivenNonFizzNumber_whenCheck_thenReturnFalse() {
    assertNonFizzNumber(1)
    assertNonFizzNumber(2)
    assertNonFizzNumber(4)
    assertNonFizzNumber(5)
    assertNonFizzNumber(7)
    assertNonFizzNumber(8)
    assertNonFizzNumber(10)
    assertNonFizzNumber(11)
  }

  func testGivenANumber_whenGenerateOuput_thenReturnFormattedOutput() {
    let output = checker.generateOutput(FizzCheckerShould.NUMBER)

    XCTAssertEqual(output, FizzCheckerShould.OUTPUT)
  }

  func testOutputFormatter() {
    let formatter = FizzFormatter()

    XCTAssertEqual(FizzFormatter.OUTPUT, formatter.format())
  }

  func assertFizzNumber(number: Int) {
    XCTAssertTrue(checker.check(number))
  }

  func assertNonFizzNumber(number: Int) {
    XCTAssertFalse(checker.check(number))
  }

}
