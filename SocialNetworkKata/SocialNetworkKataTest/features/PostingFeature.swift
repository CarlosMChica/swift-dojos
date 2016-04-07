import XCTest

/*
* User story
* Title: Posting messages to timeline
* As a user
* I want to be able to post messages
* So that I can publish messages to my timeline
*/

class PostingFeature: XCTestCase {

  private let aTimestamp = 12312312312
  private var clock: Clock!

  override func setUp() {
    super.setUp()
    clock = TestableClock(timestamp: aTimestamp)
  }

  /*
  * Scenario 1:
  * Given then user Bob
  * When user publish the message "Damn! We lost!" ( Bob -> Damn! We lost! )
  * Then the user timeline should contain post
  */
  func testShouldPublishMessageToUserTimeline() {
    let user = givenBobUser()
    let postRepository = givenPostsRepository()
    let socialNetwork = givenSocialNetworkWithPostAction(givenPostActionWith(postRepository))
    let message = givenMessage()
    let input = givenPostActionInput(user, message: message)

    socialNetwork.execute(input)

    let expectPost = Post(user: user, message: message, timestamp: aTimestamp)
    let expectedTimeline = [Post](arrayLiteral: expectPost)
    XCTAssertEqual(expectedTimeline, postRepository.timelineOf(user))
  }

  private func givenPostActionInput(user: User, message: String) -> Input {
    return Input(input: "\(user.name) -> \(message)")
  }

  private func givenMessage() -> String {
    return "Damn! We lost!"
  }

  private func givenSocialNetworkWithPostAction(postAction: PostAction) -> SocialNetwork {
    let actions = [Action](arrayLiteral: postAction)
    return SocialNetwork(actions: actions)
  }

  private func givenPostActionWith(postRepository: PostRepository) -> PostAction {
    return PostAction(postRepository: postRepository, clock: clock)
  }

  private func givenPostsRepository() -> PostRepository {
    return PostRepository()
  }

  private func givenBobUser() -> User {
    return User(name: "Bob")
  }
}
