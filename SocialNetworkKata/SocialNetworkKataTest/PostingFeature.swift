import XCTest

/*
* User story

* Title: Posting messages to timeline

* As a user
* I want to be able to post messages
* So that I can publish messages to my timeline

*/

class PostingFeature: XCTestCase {

  /*
  * Scenario 1:

  * Given then user Bob

  * When user publish the message "Damn! We lost!" ( Bob -> Damn! We lost! )

  * Then the user timeline should contain post
  */
  func testShouldPublishMessageToUserTimeline() {
    let user = User(name: "Bob")
    let postRepository = PostRepository()
    let commands = [Action](arrayLiteral: PostAction(postRepository: postRepository))
    let socialNetwork = SocialNetwork(actions: commands)
    let message = "Damn! We lost!"
    let input = "\(user.name) -> \(message)"
    let action = Input(input: input)

    socialNetwork.execute(action)

    let expectedTimeline = [Post](arrayLiteral: Post(user: user, message: message))
    XCTAssertEqual(expectedTimeline, postRepository.timelineOf(user))
  }

}
