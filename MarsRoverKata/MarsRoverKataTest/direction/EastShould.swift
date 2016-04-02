import XCTest

class EastShould: DirectionTestCase {

  func testMoveEast_whenMoveForward() throws {
    try direction.moveForward(point)

    assertMoveEastCalled()
  }

  func testMoveWest_whenMoveBackward() throws {
    try direction.moveBackward(point)

    assertMoveWestCalled()
  }

  func testLookAtNorth_whenTurnLeft() throws {
    let newDirection = try direction.turnLeft()

    assertLookingAtNorth(newDirection)
  }

  func testLookAtSouth_whenTurnRight() throws {
    let newDirection = try direction.turnRight()

    assertLookingAtSouth(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return East(planet: planet)
  }
}
