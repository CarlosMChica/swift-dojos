class RoverMovePrinter {

  let rover = MarsRover(initialPosition: RoverMovePrinter.buildInitialPosition(),
      actions: ActionsFactory.make())

  func print(input: String) {
    do {
      try rover.execute(input)
      Swift.print("Moving \(input)")
      Swift.print("Rover is at \(rover.position()) and looking at \(rover.lookingAt())")
    } catch (RoverError.UnknownCommand(let command)) {
      Swift.print("UnkownCommand: \(command)")
    } catch {
    }
  }

  static func buildInitialPosition() -> Position {
    return Position(point: Point(), direction: buildInitialDirection())
  }

  static func buildInitialDirection() -> Direction {
    return North(planet: buildPlanet())
  }

  static func buildPlanet() -> Planet {
    return Planet(planetSize: 2, obstacles: buildObstacles())
  }

  static func buildObstacles() -> [Point] {
    return [Point(x: 2, y: 1)]
  }
}

let printer = RoverMovePrinter()

printer.print("F")
printer.print("F")
printer.print("F")
printer.print("R")
printer.print("F")
printer.print("F")
printer.print("L")
printer.print("B")
printer.print("B")
printer.print("123")

