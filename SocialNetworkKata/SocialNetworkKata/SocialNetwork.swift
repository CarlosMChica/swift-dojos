class SocialNetwork {

  private let commands: [Action]

  init(commands: [Action]) {
    self.commands = commands
  }

  func execute(action: Input) {
    for command in commands {
      if (command.canExecute(action)) {
        command.execute(action)
      }
    }
  }
}