import XCTest

/**
* You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
* The rover receives a character array of commands.
* Implement commands that move the rover forward/backward (f,b).
* Implement commands that turn the rover left/right (l,r).
* Implement wrapping from one edge of the grid to another. (planets are spheres after all)
* Implement obstacle detection before each move to a new square.
If a given sequence of commands encounters an obstacle,
the rover moves up to the last possible point and reports the obstacle.
**/

class MarsRoverShould: XCTestCase {

  private let forwardCommand = "F";
  private let backwardCommand = "B";
  private let leftCommand = "L";
  private let rightCommand = "R";
  private let unkownCommand = "UNKOWN_COMMAND";
  private let multipleCommands = "MULTIPLE_COMANDS"

  let initialPoint = Point()

  func testStartLookingAtGivenDirection() {
    let initialDirection = givenDirection()
    let rover = givenMarsRoverAt(initialPositionLookingAt(initialDirection))

    let direction = rover.lookingAt()

    XCTAssertTrue(initialDirection.dynamicType == direction.dynamicType)
  }

  func testStartAtGivenPosition() {
    let rover = givenMarsRoverAt(givenPositionAtInitialPoint())

    let position = rover.position()

    XCTAssertEqual(position, initialPoint)
  }

  func testExecuteCommands_whenCommandCanExecute() {
    let action = givenActionSpy()
    let rover = givenMarsRoverAtInitialPositionWith(action)

    let commandsInput = "ab"
    try! rover.execute(commandsInput)

    XCTAssertTrue(action.executeCalled)
    XCTAssertEqual(commandsInput.characters.count, action.executeTimes)
  }

  func testThrowUnkownCommandError_whenCanNotExecuteCommand() {
    let action = givenCanNotExecuteAction()
    let rover = givenMarsRoverAtInitialPositionWith(action)

    let unkownCommand = "unkown_comand"
    AssertThrow(RoverError.UnknownCommand(command: unkownCommand),
        try! rover.execute(unkownCommand))
  }

  func givenCanNotExecuteAction() -> Action {
    return CanNotExecuteActionStub()
  }

  func givenPositionAtInitialPoint() -> Position {
    return Position(point: initialPoint, direction: DirectionSpy())
  }

  func givenDirection() -> Direction {
    return North(planet: Planet())
  }

  func initialPositionLookingAt(direction: Direction) -> Position {
    return Position(point: initialPoint, direction: direction)
  }

  func givenMarsRoverAt(position: Position) -> MarsRover {
    return MarsRover(initialPosition: position)
  }

  func givenMarsRoverAtInitialPositionWith(action: Action) -> MarsRover {
    return MarsRover(initialPosition: givenPositionAtInitialPoint(),
        actions: [Action](arrayLiteral: action))
  }

  func givenActionSpy() -> ExecuteActionSpy {
    return ExecuteActionSpy()
  }

  func AssertThrow<R, E where E: ErrorType, E: Equatable>(expectedError: E, @autoclosure _ closure: () throws -> R) -> () {
    do {
      try closure()
      XCTFail("Expected error \"\(expectedError)\", " + "but closure succeeded.")
    } catch let error as E {
      XCTAssertEqual(error, expectedError,
          "Catched error is from expected type, but not the expected case.")
    } catch {
      XCTFail("Catched error \"\(error)\", "
          + "but not the expected error "
          + "\"\(expectedError)\".")
    }
  }
}

class CanNotExecuteActionStub: Action {

  func canExecute(command: Command) -> Bool {
    return false
  }

  func execute(command: Command) -> Position {
    return Position(point: Point(), direction: DirectionSpy())
  }

}

class ExecuteActionSpy: Action {

  var executeCalled = false
  var executeTimes = 0

  func canExecute(command: Command) -> Bool {
    return true
  }

  func execute(command: Command) -> Position {
    executeCalled = true
    executeTimes += 1
    return Position(point: Point(), direction: DirectionSpy())
  }

}



