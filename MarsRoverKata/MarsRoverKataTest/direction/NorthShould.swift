import XCTest

class NorthShould: DirectionTestCase {

  func testMoveNorth_whenMoveForward() {
    direction.moveForward(point)

    assertMoveNorthCalled()
  }

  func testMoveSouth_whenMoveBackward() {
    direction.moveBackward(point)

    assertMoveSouthCalled()
  }

  func testLookAtSouth_whenTurnLeft() {
    let newDirection = direction.turnLeft()

    assertLookingAtWest(newDirection)
  }

  func testLookAtNorth_whenTurnRight() {
    let newDirection = direction.turnRight()

    assertLookingAtEast(newDirection)
  }

  override func instanstiateDirection(planet: Planet) -> Direction {
    return North(planet: planet)
  }

}
