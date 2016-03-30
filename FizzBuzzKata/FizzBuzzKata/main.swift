class DefaultView: View {
  func print(content: String) {
    Swift.print(content)
  }
}

let checkers = CheckersFactory.make()
let printer = FizzBuzzPrinter(checkers: checkers, view: DefaultView(), separator: "\n")

printer.print(1 ... 100)
