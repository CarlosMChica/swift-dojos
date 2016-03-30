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

  private static let forwardCommand = "F";
  private static let backwardCommand = "B";
  private static let leftCommand = "L";
  private static let rightCommand = "R";
  private static let unkownCommand = "UNKOWN_COMMAND";

  let initialPoint = Point()
  let direction = DirectionSpy()

  var rover: MarsRover!

  override func setUp() {
    super.setUp()
    rover = MarsRover(initialPoint: initialPoint, initialDirection: direction)
  }

  func testStartLookingAtGivenDirection() {
    let rover = MarsRover(initialPoint: initialPoint, initialDirection: North(planet: Planet(planetSize: 10)))

    let direction = rover.lookingAt()

    XCTAssertTrue(direction is North)
  }

  func testStartAtGivenPosition() {
    let position = rover.position()

    XCTAssertEqual(position, initialPoint)
  }

  func testMoveForward_whenExecuteForwardCommand() {
    rover.execute(MarsRoverShould.forwardCommand)

    XCTAssertTrue(direction.moveForwardCalled)
  }

  func testMoveBackward_whenExecuteBackwardCommand() {
    rover.execute(MarsRoverShould.backwardCommand)

    XCTAssertTrue(direction.moveBackwardCalled)
  }

  func testTurnLeft_whenExecuteTurnLeftCommand() {
    rover.execute(MarsRoverShould.leftCommand)

    XCTAssertTrue(direction.turnLeftCalled)
  }

  func testTurnRight_whenExecuteTurnRightCommand() {
    rover.execute(MarsRoverShould.rightCommand)

    XCTAssertTrue(direction.turnRightCalled)
  }

  func testDoNothing_whenExecuteUnkownCommand() {
    rover.execute(MarsRoverShould.unkownCommand)

    XCTAssertFalse(direction.turnRightCalled)
    XCTAssertFalse(direction.turnLeftCalled)
    XCTAssertFalse(direction.moveForwardCalled)
    XCTAssertFalse(direction.moveBackwardCalled)
  }

  func testDoVariousMoves_whenExecuteMultipleCommands() {
    rover.execute("FRBL")

    XCTAssertTrue(direction.moveForwardCalled)
    XCTAssertTrue(direction.turnRightCalled)
    XCTAssertTrue(direction.moveBackwardCalled)
    XCTAssertTrue(direction.turnLeftCalled)
  }

}

