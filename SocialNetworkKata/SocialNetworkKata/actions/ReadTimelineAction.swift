class ReadTimelineAction: Action {

  private let view: View
  private let postRepository: PostRepository

  init(postRepository: PostRepository, view: View) {
    self.view = view
    self.postRepository = postRepository
  }

  func canExecute(input: Input) -> Bool {
    return false
  }

  func execute(input: Input) {
  }

}
