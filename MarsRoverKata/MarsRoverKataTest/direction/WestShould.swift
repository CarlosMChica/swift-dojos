import XCTest

class WestShould: DirectionTestCase {

  func testMoveWest_whenMoveForward() {
    direction.moveForward(point)

    assertMoveWestCalled()
  }

  func testMoveEast_whenMoveBackward() {
    direction.moveBackward(point)

    assertMoveEastCalled()
  }

  func testLookAtSouth_whenTurnLeft() {
    let newDirection = direction.turnLeft()

    assertLookingAtSouth(newDirection)
  }

  func testLookAtNorth_whenTurnRight() {
    let newDirection = direction.turnRight()

    assertLookingAtNorth(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return West(planet: planet)
  }

}
