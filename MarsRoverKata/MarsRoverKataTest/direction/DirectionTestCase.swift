import XCTest

class DirectionTestCase: XCTestCase {

  let point = Point()

  var direction: Direction!

  private let planet = PlanetSpy(planetSize: 0)

  override func setUp() {
    super.setUp()
    direction = instanstiateDirection(planet)
  }

  func assertMoveWestCalled() {
    XCTAssertTrue(planet.moveWestCalled)
  }

  func assertMoveEastCalled() {
    XCTAssertTrue(planet.moveEastCalled)
  }

  func assertMoveNorthCalled() {
    XCTAssertTrue(planet.moveNorthCalled)
  }

  func assertMoveSouthCalled() {
    XCTAssertTrue(planet.moveSouthCalled)
  }

  func assertLookingAtSouth(direction: Direction) {
    XCTAssertTrue(direction is South)
  }

  func assertLookingAtNorth(direction: Direction) {
    XCTAssertTrue(direction is North)
  }

  func assertLookingAtWest(direction: Direction) {
    XCTAssertTrue(direction is West)
  }

  func assertLookingAtEast(direction: Direction) {
    XCTAssertTrue(direction is East)
  }

  func instanstiateDirection(planet: Planet) -> Direction {
    preconditionFailure("This method must be overridden")
  }
}
