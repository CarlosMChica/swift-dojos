import XCTest

class SocialNetworkShould: XCTestCase {

  func test_execute_only_command_that_can_execute_the_given_action() {
    let canExecuteCommand = ActionSpy(canExecute: true)
    let canNotExecuteCommand = ActionSpy(canExecute: false)
    let commands = [Action](arrayLiteral: canExecuteCommand, canNotExecuteCommand)
    let socialNetwork = SocialNetwork(commands: commands)
    let action = Input(input: "input")

    socialNetwork.execute(action)

    XCTAssertTrue(canExecuteCommand.executeCalled)
    XCTAssertEqual(action, canExecuteCommand.executeInput)
    XCTAssertFalse(canNotExecuteCommand.executeCalled)
  }


}
