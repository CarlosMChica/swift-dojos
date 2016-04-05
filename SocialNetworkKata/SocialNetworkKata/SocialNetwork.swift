class SocialNetwork {

  private let actions: [Action]

  init(actions: [Action]) {
    self.actions = actions
  }

  func execute(input: Input) {
    for action in actions {
      if (action.canExecute(input)) {
        action.execute(input)
      }
    }
  }
}