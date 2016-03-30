public class CheckersFactory {

  public static func make() -> [Checker] {
    let fizzChecker = FizzChecker()
    let buzzChecker = BuzzChecker()
    let fizzBuzzChecker = FizzBuzzChecker(fizzChecker: fizzChecker, buzzChecker: buzzChecker)
    let defaultChecker = DefaultChecker()

    return [fizzBuzzChecker, fizzChecker, buzzChecker, defaultChecker]
  }
}
