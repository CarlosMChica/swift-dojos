import XCTest

class MoveMarsRoverFeature: XCTestCase {

  func testRoverShouldMoveWrappingFromPlanetEdges() {
    let planet = Planet(planetSize: 10)
    let rover = MarsRover(initialPoint: Point(), initialDirection: North(planet: planet))

    rover.execute("FFRFFLBBB")

    let finalPoint = Point(x: 2, y: 10)
    XCTAssertEqual(finalPoint, rover.position())
  }

  func testRoverShouldStayAtPositionIfEncountersObstacle() {
    let initialPoint = Point()
    let planet = Planet(planetSize: 10, obstacles: [Point(x: 0, y: 1)])
    let rover = MarsRover(initialPoint: initialPoint, initialDirection: North(planet: planet))

    rover.execute("FF")

    XCTAssertEqual(initialPoint, rover.position())
  }
}
