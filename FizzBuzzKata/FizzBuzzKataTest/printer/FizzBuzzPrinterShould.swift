import XCTest

class FizzBuzzPrinterShould: XCTestCase {

  let NUMBER = 3
  let validChecker = ValidCheckerSpy()
  let invalidChecker = InvalidCheckerSpy()
  let view = ViewSpy()

  func test_givenCheckers_whenPrint_thenCheckUntilValidCheckerFound() {
    let fizzBuzz = FizzBuzzPrinter(checkers: [validChecker, invalidChecker], view: view)

    fizzBuzz.print(NUMBER)

    XCTAssertTrue(validChecker.checkCalled)
    XCTAssertFalse(invalidChecker.checkCalled)
  }

  func test_givenValidChecker_whenPrint_thenPrintChecker() {
    let fizzBuzz = FizzBuzzPrinter(checkers: [validChecker], view: view)

    fizzBuzz.print(NUMBER)

    XCTAssertTrue(validChecker.generateOutputCalled)
  }

  func test_givenInvalidChecker_whenPrint_thenDoNotPrintChecker() {
    let fizzBuzz = FizzBuzzPrinter(checkers: [invalidChecker], view: view)

    fizzBuzz.print(NUMBER)

    XCTAssertFalse(validChecker.generateOutputCalled)
  }

}


class CheckerSpy: Checker {
  var checkCalled = false, generateOutputCalled = false

  init() {
  }

  func check(number: Int) -> Bool {
    checkCalled = true
    return false
  }

  func generateOutput(number: Int) -> String {
    generateOutputCalled = true
    return ""
  }

  func print(number: Int) {
  }

}

class ValidCheckerSpy: CheckerSpy {

  override func check(number: Int) -> Bool {
    super.check(number)
    return true
  }

}

class InvalidCheckerSpy: CheckerSpy {

  override func check(number: Int) -> Bool {
    super.check(number)
    return false
  }

}
