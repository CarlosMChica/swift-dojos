class PostAction: Action {

  private let identifier = "->"
  private let postRepository: PostRepository
  private let clock: Clock

  init(postRepository: PostRepository, clock: Clock) {
    self.postRepository = postRepository
    self.clock = clock
  }

  func canExecute(input: Input) -> Bool {
    return input.hasIdentifier(identifier)
  }

  func execute(input: Input) {
    let user = User(name: input.getFirstArgument())
    let message = input.getIdentifierArgument(identifier)!
    postRepository.store(Post(user: user, message: message, timestamp: 0))
  }

}
