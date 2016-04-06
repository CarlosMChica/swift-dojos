import XCTest

class PostActionShould: XCTestCase {

  private let arrow = "->"
  private let userName = "userName"
  private let message = "message"
  private let invalidInput = "awdwad"
  private let timestamp: CLong = 123123123
  private var clock: Clock!
  private var validInput: String!

  override func setUp() {
    super.setUp()
    clock = TestableClock(timestamp: timestamp)
    validInput = userName + " " + arrow + " " + message
  }

  func test_return_can_execute_true_for_action_with_arrow_as_first_parameter() {
    let action = givenPostAction()
    let input = givenValidInput()

    let canExecute = action.canExecute(input)

    XCTAssertTrue(canExecute)
  }

  func test_return_can_execute_false_for_action_without_arrow_as_first_parameter() {
    let action = givenPostAction()
    let input = givenInvalidInput()

    let canExecute = action.canExecute(input)

    XCTAssertFalse(canExecute)
  }

  func test_store_post_with_current_timestamp_when_executed() {
    let postRepository = givenPostRepository()
    let action = givenPostAction(postRepository)
    let input = givenValidInput()

    action.execute(input)

    let expectedPost = Post(user: User(name: userName), message: message, timestamp: timestamp)
    XCTAssertTrue(postRepository.storeCalled)
    XCTAssertEqual(expectedPost, postRepository.storedPost)
  }

  private func givenPostRepository() -> PostRepositorySpy {
    return PostRepositorySpy()
  }

  private func givenPostAction() -> PostAction {
    return PostAction(postRepository: givenPostRepository(), clock: clock)
  }

  private func givenPostAction(postRepository: PostRepository) -> PostAction {
    return PostAction(postRepository: postRepository, clock: clock)
  }

  private func givenValidInput() -> Input {
    return Input(input: validInput)
  }

  private func givenInvalidInput() -> Input {
    return Input(input: invalidInput)
  }
}
