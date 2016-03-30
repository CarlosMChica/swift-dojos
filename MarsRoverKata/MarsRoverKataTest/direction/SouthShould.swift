import XCTest

class SouthShould: DirectionTestCase {

  func testMoveSouth_whenMoveForward() {
    direction.moveForward(point)

    assertMoveSouthCalled()
  }

  func testMoveNorth_whenMoveBackward() {
    direction.moveBackward(point)

    assertMoveNorthCalled()
  }

  func testLookAtEast_whenTurnLeft() {
    let newDirection = direction.turnLeft()

    assertLookingAtEast(newDirection)
  }

  func testLookAtWest_whenTurnRight() {
    let newDirection = direction.turnRight()

    assertLookingAtWest(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return South(planet: planet)
  }

}
