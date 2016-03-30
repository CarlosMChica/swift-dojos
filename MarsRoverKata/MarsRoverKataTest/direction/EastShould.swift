import XCTest

class EastShould: DirectionTestCase {

  func testMoveEast_whenMoveForward() {
    direction.moveForward(point)

    assertMoveEastCalled()
  }

  func testMoveWest_whenMoveBackward() {
    direction.moveBackward(point)

    assertMoveWestCalled()
  }

  func testLookAtNorth_whenTurnLeft() {
    let newDirection = direction.turnLeft()

    assertLookingAtNorth(newDirection)
  }

  func testLookAtSouth_whenTurnRight() {
    let newDirection = direction.turnRight()

    assertLookingAtSouth(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return East(planet: planet)
  }
}
