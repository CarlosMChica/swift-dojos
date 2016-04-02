import XCTest

class WestShould: DirectionTestCase {

  func testMoveWest_whenMoveForward() throws {
    try direction.moveForward(point)

    assertMoveWestCalled()
  }

  func testMoveEast_whenMoveBackward() throws {
    try direction.moveBackward(point)

    assertMoveEastCalled()
  }

  func testLookAtSouth_whenTurnLeft() throws {
    let newDirection = try direction.turnLeft()

    assertLookingAtSouth(newDirection)
  }

  func testLookAtNorth_whenTurnRight() throws {
    let newDirection = try direction.turnRight()

    assertLookingAtNorth(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return West(planet: planet)
  }

}
