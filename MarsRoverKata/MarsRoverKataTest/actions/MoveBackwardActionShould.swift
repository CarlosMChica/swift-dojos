import XCTest

class MoveBackwardActionShould: XCTestCase {

  let action = MoveBackwardAction()
  let position = PositionSpy()
  let invalidCommand = "invalidCommand"

  func testMoveBackward_whenExecute() throws {
    let command = givenAnyCommand()

    try action.execute(command)

    XCTAssertTrue(position.moveBackwardCalled)
  }

  func testReturnCanExecuteCommandTrue_whenCommandInputIsValid() {
    let command = givenValidCommand()

    let canExecute = action.canExecute(command)

    XCTAssertTrue(canExecute)
  }

  func testReturnCanExecuteCommandFalse_whenCommandInputIsInvalid() {
    let command = givenInvalidCommand()

    let canExecute = action.canExecute(command)

    XCTAssertFalse(canExecute)
  }

  func givenAnyCommand() -> Command {
    return Command(position: position)
  }

  func givenValidCommand() -> Command {
    return Command(input: MoveBackwardAction.commandInput, position: position)
  }

  func givenInvalidCommand() -> Command {
    return Command(input: invalidCommand, position: position)
  }
}
