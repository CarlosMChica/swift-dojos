class ReadTimelineAction: Action {

  private let postRepository: PostRepository
  private let printer: TimelinePrinter

  init(postRepository: PostRepository, printer: TimelinePrinter) {
    self.printer = printer
    self.postRepository = postRepository
  }

  func canExecute(input: Input) -> Bool {
    return input.hasSingleArgument()
  }

  func execute(input: Input) {
    let user = User(name: input.getFirstArgument())
    let timelinePosts = postRepository.timelineOf(user)
    printer.print(timelinePosts)
  }

}
