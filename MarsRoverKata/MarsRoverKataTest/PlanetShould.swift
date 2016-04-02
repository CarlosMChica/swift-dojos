import XCTest

class PlanetShould: XCTestCase {

  private static let planetSize = 10

  private let aPoint = Point(x: planetSize / 2, y: planetSize / 2)

  private var planet: Planet!

  override func setUp() {
    super.setUp()
    planet = Planet(planetSize: PlanetShould.planetSize)
  }

  func testReturnPointAtEast_whenMoveEast() throws {
    let pointAtEast = try planet.moveEast(aPoint)

    XCTAssertEqual(pointAtEast, Point(x: aPoint.x + 1, y: aPoint.y))
  }

  func testReturnPointAtWest_whenMoveWest() throws {
    let pointAtWest = try planet.moveWest(aPoint)

    XCTAssertEqual(pointAtWest, Point(x: aPoint.x - 1, y: aPoint.y))
  }

  func testReturnPointAtNorth_whenMoveNorth() throws {
    let pointAtNorth = try planet.moveNorth(aPoint)

    XCTAssertEqual(pointAtNorth, Point(x: aPoint.x, y: aPoint.y + 1))
  }

  func testReturnPointAtSouth_whenMoveSouth() throws {
    let pointAtSouth = try planet.moveSouth(aPoint)

    XCTAssertEqual(pointAtSouth, Point(x: aPoint.x, y: aPoint.y - 1))
  }

  func testWrapToWestBorder_whenMovingEastFromEastBorder() throws {
    let aPointAtEastBorder = Point(x: PlanetShould.planetSize, y: 0)

    let nextPoint = try planet.moveEast(aPointAtEastBorder)

    XCTAssertEqual(nextPoint, Point(x: 0, y: 0))
  }

  func testWrapToEastBorder_whenMovingWestFromWestBorder() throws {
    let aPointAtWestBorder = Point(x: 0, y: 0)

    let nextPoint = try planet.moveWest(aPointAtWestBorder)

    XCTAssertEqual(nextPoint, Point(x: PlanetShould.planetSize, y: 0))
  }

  func testWrapToSouthBorder_whenMovingNorthFromNorthBorder() throws {
    let aPointAtWestBorder = Point(x: 0, y: PlanetShould.planetSize)

    let nextPoint = try planet.moveNorth(aPointAtWestBorder)

    XCTAssertEqual(nextPoint, Point(x: 0, y: 0))
  }

  func testWrapToNorthBorder_whenMovingSouthFromSouthBorder() throws {
    let aPointAtSouthBorder = Point(x: 0, y: 0)

    let nextPoint = try planet.moveSouth(aPointAtSouthBorder)

    XCTAssertEqual(nextPoint, Point(x: 0, y: PlanetShould.planetSize))
  }

  func testThrowObstacleFound_whenMovingToPointWithObstacle() throws {
    let point = Point()
    let obstaclePoint = Point(x: 1, y: 0)
    let planet = Planet(planetSize: PlanetShould.planetSize, obstacles: [obstaclePoint])

    XCTAssertThrow(PlanetError.ObstacleFound(point: obstaclePoint), try planet.moveEast(point))
  }
}
