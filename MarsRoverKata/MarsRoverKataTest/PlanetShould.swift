import XCTest

class PlanetShould: XCTestCase {

  private static let planetSize = 10

  private let aPoint = Point(x: planetSize / 2, y: planetSize / 2)

  private var planet: Planet!

  override func setUp() {
    super.setUp()
    planet = Planet(planetSize: PlanetShould.planetSize)
  }

  func testReturnPointAtEast_whenMoveEast() {
    let pointAtEast = planet.moveEast(aPoint)

    XCTAssertEqual(pointAtEast, Point(x: aPoint.x + 1, y: aPoint.y))
  }

  func testReturnPointAtWest_whenMoveWest() {
    let pointAtWest = planet.moveWest(aPoint)

    XCTAssertEqual(pointAtWest, Point(x: aPoint.x - 1, y: aPoint.y))
  }

  func testReturnPointAtNorth_whenMoveNorth() {
    let pointAtNorth = planet.moveNorth(aPoint)

    XCTAssertEqual(pointAtNorth, Point(x: aPoint.x, y: aPoint.y + 1))
  }

  func testReturnPointAtSouth_whenMoveSouth() {
    let pointAtSouth = planet.moveSouth(aPoint)

    XCTAssertEqual(pointAtSouth, Point(x: aPoint.x, y: aPoint.y - 1))
  }

  func testWrapToWestBorder_whenMovingEastFromEastBorder() {
    let aPointAtEastBorder = Point(x: PlanetShould.planetSize, y: 0)

    let nextPoint = planet.moveEast(aPointAtEastBorder)

    XCTAssertEqual(nextPoint, Point(x: 0, y: 0))
  }

  func testWrapToEastBorder_whenMovingWestFromWestBorder() {
    let aPointAtWestBorder = Point(x: 0, y: 0)

    let nextPoint = planet.moveWest(aPointAtWestBorder)

    XCTAssertEqual(nextPoint, Point(x: PlanetShould.planetSize, y: 0))
  }

  func testWrapToSouthBorder_whenMovingNorthFromNorthBorder() {
    let aPointAtWestBorder = Point(x: 0, y: PlanetShould.planetSize)

    let nextPoint = planet.moveNorth(aPointAtWestBorder)

    XCTAssertEqual(nextPoint, Point(x: 0, y: 0))
  }

  func testWrapToNorthBorder_whenMovingSouthFromSouthBorder() {
    let aPointAtSouthBorder = Point(x: 0, y: 0)

    let nextPoint = planet.moveSouth(aPointAtSouthBorder)

    XCTAssertEqual(nextPoint, Point(x: 0, y: PlanetShould.planetSize))
  }

  func testStayAtPosition_whenMovingToPointWithObstacle() {
    let point = Point()
    let planet = Planet(planetSize: PlanetShould.planetSize, obstacles: [Point(x: 1, y: 0)])

    let nextPoint = planet.moveEast(point)

    XCTAssertEqual(nextPoint, point)
  }
}
