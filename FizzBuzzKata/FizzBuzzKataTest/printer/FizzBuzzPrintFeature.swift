import XCTest

//Write a program that determines if a number is "Fizz", "Buzz" or "FizzBuzz".
//For multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz".
//For numbers which are multiples of both three and five print "FizzBuzz".
//
//Sample output:
//
//1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz etc

class FizzBuzzPrintFeature: XCTestCase {

  static let NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  static let OUTPUT = "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz"

  func testGivenNumbersFrom1To20_whenPrint_thenPrintExpectedOutput() {
    let view = ViewSpy()
    let checkers = CheckersFactory.make()
    let printer = FizzBuzzPrinter(checkers: checkers, view: view)

    printer.print(FizzBuzzPrintFeature.NUMBERS)

    XCTAssertEqual(FizzBuzzPrintFeature.OUTPUT, view.printContent)
  }
}
