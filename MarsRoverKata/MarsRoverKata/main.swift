class RoverMovePrinter {

  let rover = MarsRover(initialPoint: Point(),
      initialDirection: North(planet: Planet(planetSize: 2, obstacles: [Point(x: 2, y: 1)])))

  func print(command: String) {
    rover.execute(command)
    Swift.print("Moving \(command)")
    Swift.print("Rover is at \(rover.position()) and looking at \(rover.lookingAt())")
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
