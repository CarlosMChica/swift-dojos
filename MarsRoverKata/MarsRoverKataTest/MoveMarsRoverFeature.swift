import XCTest

class MoveMarsRoverFeature: XCTestCase {

  static let planetSize = 10

  func testRoverShouldMoveWrappingFromPlanetEdges() {
    let planet = givenPlanetWithoutObstacles()
    let position = givenInitialPositionAt(planet)
    let rover = givenMarsRoverAtInitialPosition(position)

    try! rover.execute("FFRFFLBBB")

    let finalPoint = Point(x: 2, y: 10)
    XCTAssertEqual(finalPoint, rover.position())
  }

  func testRoverShouldReportObstacleAndGoBackToPreviousWhenObstacleFound() throws {
    let obstaclePoint = Point(x: 0, y: 2)
    let planet = givenPlanetWithObstacle(obstaclePoint)
    let position = givenInitialPositionAt(planet)
    let rover = givenMarsRoverAtInitialPosition(position)

    XCTAssertThrow(PlanetError.ObstacleFound(point: obstaclePoint), try rover.execute("FF"))

    let finalPoint = Point(x: 0, y: 1)
    XCTAssertEqual(finalPoint, rover.position())
  }

  func givenPlanetWithoutObstacles() -> Planet {
    return Planet(planetSize: MoveMarsRoverFeature.planetSize)
  }

  func givenPlanetWithObstacle(obstacle : Point) -> Planet {
    return Planet(planetSize: MoveMarsRoverFeature.planetSize, obstacles: [obstacle])
  }

  func givenInitialPositionAt(planet: Planet) -> Position {
    return Position(point: Point(), direction: North(planet: planet))
  }

  func givenMarsRoverAtInitialPosition(position: Position) -> MarsRover {
    return MarsRover(initialPosition: position, actions: ActionsFactory.make())
  }
}
