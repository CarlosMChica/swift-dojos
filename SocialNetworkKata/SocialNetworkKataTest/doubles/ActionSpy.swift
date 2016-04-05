class ActionSpy: Action {

  var executeCalled = false
  var executeInput = Input(input: "")
  let canExecute: Bool

  init(canExecute: Bool) {
    self.canExecute = canExecute
  }

  func canExecute(input: Input) -> Bool {
    return canExecute
  }

  func execute(input: Input) {
    executeCalled = true
    executeInput = input
  }

}


