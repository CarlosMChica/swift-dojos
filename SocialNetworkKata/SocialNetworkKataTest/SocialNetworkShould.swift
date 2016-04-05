import XCTest

class SocialNetworkShould: XCTestCase {

  func test_execute_only_action_that_can_execute_given_input() {
    let canExecuteAction = givenCanExecuteAction()
    let canNotExecuteAction = givenCanNotExecuteAction()
    let socialNetwork = givenSocialNetworkWithActions(canExecuteAction, canNotExecuteAction)
    let input = givenInput()

    socialNetwork.execute(input)

    XCTAssertTrue(canExecuteAction.executeCalled)
    XCTAssertEqual(input, canExecuteAction.executeInput)
    XCTAssertFalse(canNotExecuteAction.executeCalled)
  }

  private func givenSocialNetworkWithActions(actions: Action...) -> SocialNetwork {
    return SocialNetwork(actions: actions)
  }

  private func givenInput() -> Input {
    return Input(input: "input")
  }

  private func givenCanExecuteAction() -> ActionSpy {
    return ActionSpy(canExecute: true)
  }

  private func givenCanNotExecuteAction() -> ActionSpy {
    return ActionSpy(canExecute: false)
  }

}
