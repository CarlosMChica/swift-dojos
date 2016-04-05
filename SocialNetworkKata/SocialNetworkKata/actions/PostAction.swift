class PostAction: Action {

  private let identifier = "->"
  private let postRepository: PostRepository

  init(postRepository: PostRepository) {
    self.postRepository = postRepository
  }

  func canExecute(action: Input) -> Bool {
    return identifier == action.getParamAtPosition(1)
  }

  func execute(action: Input) {
    let user = User(name: action.getParamAtPosition(0))
    let message = action.getParamAtPosition(2)
    postRepository.store(Post(user: user, message: message))
  }

}
