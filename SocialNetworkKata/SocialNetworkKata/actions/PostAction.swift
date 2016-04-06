class PostAction: Action {

  private let identifier = "->"
  private let postRepository: PostRepository

  init(postRepository: PostRepository) {
    self.postRepository = postRepository
  }

  func canExecute(input: Input) -> Bool {
    return input.hasIdentifier(identifier)
  }

  func execute(input: Input) {
    let user = User(name: input.getFirstArgument())
    let message = input.getIdentifierArgument(identifier)!
    postRepository.store(Post(user: user, message: message))
  }

}
