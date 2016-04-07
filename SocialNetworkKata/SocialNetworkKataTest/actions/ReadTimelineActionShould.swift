import XCTest

class ReadTimelineActionShould: XCTestCase {

  func test_return_can_execute_true_for_input_with_single_parameter() {
    let action = givenReadAction()
    let input = givenInputWithSingleArgument()

    let canExecute = action.canExecute(input)

    XCTAssertTrue(canExecute)
  }

  func test_return_can_execute_false_for_input_with_more_than_one_parameter() {
    let action = givenReadAction()
    let input = givenInputWithSingleArgument()

    let canExecute = action.canExecute(input)

    XCTAssertTrue(canExecute)
  }

  func test_print_user_timeline_messages_when_execute() {
    let printer = givenTimelinePrinter()
    let timelineUser = givenTimelineUser()
    let userTimelinePosts = givenTimelinePostsFor(timelineUser)
    let action = givenReadActionWith(aPostRepositoryWith(userTimelinePosts), printer: printer)
    let input = givenReadTimelineInput(timelineUser)

    action.execute(input)

    XCTAssertEqual(userTimelinePosts, printer.postsPrinted)
  }

  func givenTimelinePrinter() -> TimelinePrinterSpy {
    return TimelinePrinterSpy()
  }

  func givenReadTimelineInput(user: User) -> Input {
    return Input(input: user.name)
  }

  func givenTimelinePostsFor(user: User) -> [Post] {
    let clock = givenClock()
    let post = Post(user: user, message: " message 1", timestamp: clock.currentTimeInMillis())
    return [Post](arrayLiteral: post)
  }

  func givenTimelineUser() -> User {
    return User(name: "timelineUserName")
  }

  func givenReadAction() -> ReadTimelineAction {
    return ReadTimelineAction(postRepository: givenPostRepository(), printer: TimelinePrinterSpy())
  }

  func givenReadActionWith(postRepository: PostRepository, printer: TimelinePrinter) -> ReadTimelineAction {
    return ReadTimelineAction(postRepository: postRepository, printer: printer)
  }

  func givenInputWithMoreThanOneArgument() -> Input {
    return Input(input: "singleParameter")
  }

  func givenInputWithSingleArgument() -> Input {
    return Input(input: "singleParameter")
  }

  func givenViewSpy() -> ViewSpy {
    return ViewSpy()
  }

  func aPostRepositoryWith(posts: [Post]) -> PostRepositorySpy {
    return PostRepositorySpy(posts: posts)
  }

  func givenPostRepository() -> PostRepositorySpy {
    return PostRepositorySpy()
  }

  func givenClock() -> Clock {
    return Clock()
  }
}
