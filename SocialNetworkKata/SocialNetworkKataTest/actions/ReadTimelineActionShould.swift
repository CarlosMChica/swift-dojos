import XCTest

class ReadTimelineActionShould: XCTestCase {

  func test_return_can_execute_true_for_input_with_single_parameter() {
    let action = givenReadAction()
    let input = givenInputWithSingleArgument()

    let canExecute = action.canExecute(input)

    XCTAssertTrue(canExecute)
  }

  func test_return_can_execute_false_for_input_with_more_than_one_parameter() {
    let action = givenReadAction()
    let input = givenInputWithSingleArgument()

    let canExecute = action.canExecute(input)

    XCTAssertTrue(canExecute)
  }

  func givenReadAction() -> ReadTimelineAction {
    return ReadTimelineAction(postRepository: givenPostRepository(), view: givenViewSpy())
  }

  func givenInputWithMoreThanOneArgument() -> Input {
    return Input(input: "singleParameter")
  }

  func givenInputWithSingleArgument() -> Input {
    return Input(input: "singleParameter")
  }

  func givenViewSpy() -> ViewSpy {
    return ViewSpy()
  }

  func givenPostRepository() -> PostRepositorySpy {
    return PostRepositorySpy()
  }
}
