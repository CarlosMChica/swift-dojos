import XCTest

class InputShould: XCTestCase {

  func test_return_trimmed_argument_after_identifier_when_get_identifier_argument() {
    let identifier = givenIdentifier()
    let thirdArgument = givenIdentifierArgument()
    let input = Input(input: "argument1" + " " + identifier + " " + thirdArgument)

    let identifierArgument = input.getIdentifierArgument(identifier)

    XCTAssertEqual(thirdArgument, identifierArgument)
  }

  func test_return_null_given_input_without_argument_when_get_identifier_argument() {
    let identifier = givenIdentifier()
    let thirdArgument = givenIdentifierArgument()
    let input = Input(input: "argument1" + " " + thirdArgument)

    let identifierArgument = input.getIdentifierArgument(identifier)

    XCTAssertNil(identifierArgument)
  }

  func test_return_true_when_has_identifier_if_input_contains_identifier() {
    let identifier = givenIdentifier()
    let input = Input(input: "argument1" + " " + identifier)

    let hasIdentifier = input.hasIdentifier(identifier)

    XCTAssertTrue(hasIdentifier)
  }

  func test_return_false_when_has_identifier_if_input_does_not_contains_identifier() {
    let identifier = givenIdentifier()
    let input = Input(input: "argument1")

    let hasIdentifier = input.hasIdentifier(identifier)

    XCTAssertFalse(hasIdentifier)
  }

  func test_return_true_when_has_one_parameter_if_input_does_not_contains_spaces() {
    let input = Input(input: "argument1")

    let hasSingleArgument = input.hasSingleArgument()

    XCTAssertTrue(hasSingleArgument)
  }

  func test_return_false_when_has_one_parameter_if_input_contains_spaces() {
    let input = Input(input: "argument1 argument2")

    let hasSingleArgument = input.hasSingleArgument()

    XCTAssertFalse(hasSingleArgument)
  }

  private func givenIdentifier() -> String {
    return "->"
  }

  private func givenIdentifierArgument() -> String {
    return "argument3 4 5"
  }
}
