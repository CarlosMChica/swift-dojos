class Planet {

  typealias PointMover = (point:Point) -> Point
  typealias PointChecker = (point:Point) -> Bool

  private let planetSize: Int
  private let obstacles: [Point]

  init(planetSize: Int = 0, obstacles: [Point] = []) {
    self.planetSize = planetSize
    self.obstacles = obstacles
  }

  func moveSouth(point: Point) -> Point {
    return move(point,
        isAt: southBorder,
        wrapTo: pointAtNorthBorder,
        moveTo: pointAtSouthOf)
  }

  func moveNorth(point: Point) -> Point {
    return move(point,
        isAt: northBorder,
        wrapTo: pointAtSouthBorder,
        moveTo: pointAtNorthOf)
  }

  func moveEast(point: Point) -> Point {
    return move(point,
        isAt: eastBorder,
        wrapTo: pointAtWestBorder,
        moveTo: pointAtEastOf)
  }

  func moveWest(point: Point) -> Point {
    return move(point,
        isAt: westBorder,
        wrapTo: pointAtEastBorder,
        moveTo: pointAtWestOf)
  }

  private func move(point: Point,
                    isAt isAtBorder: PointChecker,
                    wrapTo: PointMover,
                    moveTo: PointMover) -> Point {

    var nextPoint: Point
    if (isAtBorder(point: point)) {
      nextPoint = wrapTo(point: point)
    } else {
      nextPoint = moveTo(point: point)
    }

    if (isThereAnObstacleAt(nextPoint)) {
      return point
    } else {
      return nextPoint
    }
  }

  private func isThereAnObstacleAt(point: Point) -> Bool {
    for obstacle in obstacles {
      if (obstacle == point) {
        return true
      }
    }
    return false
  }

  private func pointAtNorthBorder(point: Point) -> Point {
    return Point(x: point.x, y: planetSize)
  }

  private func pointAtSouthBorder(point: Point) -> Point {
    return Point(x: point.x, y: 0)
  }

  private func pointAtWestBorder(point: Point) -> Point {
    return Point(x: 0, y: point.y)
  }

  private func pointAtEastBorder(point: Point) -> Point {
    return Point(x: planetSize, y: point.y)
  }

  private func southBorder(point: Point) -> Bool {
    return point.y == 0
  }

  private func northBorder(point: Point) -> Bool {
    return point.y == planetSize
  }

  private func eastBorder(point: Point) -> Bool {
    return point.x == planetSize
  }

  private func westBorder(point: Point) -> Bool {
    return point.x == 0
  }

  private func pointAtSouthOf(point: Point) -> Point {
    return Point(x: point.x, y: point.y - 1)
  }

  private func pointAtWestOf(point: Point) -> Point {
    return Point(x: point.x - 1, y: point.y)
  }

  private func pointAtEastOf(point: Point) -> Point {
    return Point(x: point.x + 1, y: point.y)
  }

  private func pointAtNorthOf(point: Point) -> Point {
    return Point(x: point.x, y: point.y + 1)
  }
}
