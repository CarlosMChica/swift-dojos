import XCTest

class SouthShould: DirectionTestCase {

  func testMoveSouth_whenMoveForward() throws {
    try direction.moveForward(point)

    assertMoveSouthCalled()
  }

  func testMoveNorth_whenMoveBackward() throws {
    try direction.moveBackward(point)

    assertMoveNorthCalled()
  }

  func testLookAtEast_whenTurnLeft() throws {
    let newDirection = try direction.turnLeft()

    assertLookingAtEast(newDirection)
  }

  func testLookAtWest_whenTurnRight() throws {
    let newDirection = try direction.turnRight()

    assertLookingAtWest(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return South(planet: planet)
  }

}
