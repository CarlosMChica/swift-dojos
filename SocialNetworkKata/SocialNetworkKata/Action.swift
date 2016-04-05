import Foundation

protocol Action {

  func canExecute(input: Input) -> Bool

  func execute(input: Input)
}
