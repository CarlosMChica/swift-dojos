import XCTest

class NorthShould: DirectionTestCase {

  func testMoveNorth_whenMoveForward() throws {
    try direction.moveForward(point)

    assertMoveNorthCalled()
  }

  func testMoveSouth_whenMoveBackward() throws {
    try direction.moveBackward(point)

    assertMoveSouthCalled()
  }

  func testLookAtSouth_whenTurnLeft() throws {
    let newDirection = try direction.turnLeft()

    assertLookingAtWest(newDirection)
  }

  func testLookAtNorth_whenTurnRight() throws {
    let newDirection = try direction.turnRight()

    assertLookingAtEast(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return North(planet: planet)
  }

}
