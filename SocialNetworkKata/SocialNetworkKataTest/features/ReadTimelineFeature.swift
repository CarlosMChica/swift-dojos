import XCTest

/*
* User story
* Title: Reading user's timeline messages
* As a user
* I want to be able to read my timeline
* So that I can check the messages that I've published to my timeline
*/

class ReadTimelineFeature: XCTestCase {

  private var firstMessage: String!
  private var secondMessage: String!
  private var readBobTimeline: Input!
  private var postFirstMessage: Input!
  private var postSecondMessage: Input!
  private var clock: Clock!
  private var socialNetwork: SocialNetwork!
  private var printer: TimelinePrinter!

  private let view = ViewSpy()

  override func setUp() {
    super.setUp()
    printer = TimelinePrinter(view: view)
    firstMessage = givenFirstMessage()
    secondMessage = givenSecondMessage()
    readBobTimeline = givenReadBobTimelineInput()
    postFirstMessage = givenPostFirstMessageInput()
    postSecondMessage = givenPostSecondMessageInput()
    clock = TestableClock(timestamps: givenPostedMessagesTimestamps())
    socialNetwork = givenSocialNetwork()
  }

  /*
  * Scenario 1:
  * Given the user Bob
  * And posted message "Damn! We lost!" published 2 minutes ago
  * And posted message "Good game though." published 1 minute ago
  * When user reads her timeline
  * Then should show "Good game though. (1 minute ago)"
  * And should show "Damn! We lost! (2 minutes ago)"
  */
  func testShouldShowTimelineMessagesInReverseChronologicalOrder() {
    socialNetwork.execute(postFirstMessage)
    socialNetwork.execute(postSecondMessage)

    socialNetwork.execute(readBobTimeline)

    XCTAssertEqual(firstMessage, view.getMessagePrinted(0))
    XCTAssertEqual(secondMessage, view.getMessagePrinted(1))
  }

  func givenSocialNetwork() -> SocialNetwork {
    return SocialNetwork(actions: givenActions())
  }

  func givenActions() -> [Action] {
    let postRepository = givenPostsRepository()
    let postAction = PostMessageAction(postRepository: postRepository, clock: clock)
    let readAction = ReadTimelineAction(postRepository: postRepository, printer: printer)
    return [Action](arrayLiteral: postAction, readAction)
  }

  private func givenPostsRepository() -> PostRepository {
    return PostRepository()
  }

  func givenReadBobTimelineInput() -> Input {
    return Input(input: "Bob")
  }

  func givenPostFirstMessageInput() -> Input {
    return Input(input: "Bob -> Damn! We lost!")
  }

  func givenPostSecondMessageInput() -> Input {
    return Input(input: "Bob -> Good game though.")
  }

  func givenFirstMessage() -> String {
    return "Damn! We lost! (2 minutes ago)"
  }

  func givenSecondMessage() -> String {
    return "Good game though. (1 minute ago)"
  }

  func givenPostedMessagesTimestamps() -> [CLong] {
    let firstMessageTimestamp = getMinutesAgoInMillis(1)
    let secondMessageTimestamp = getMinutesAgoInMillis(2)
    return [CLong](arrayLiteral: firstMessageTimestamp, secondMessageTimestamp)
  }

  func getMinutesAgoInMillis(minutes: Int) -> CLong {
    let minutesAgoInMillis = (minutes * 60 * 1000)
    return Clock().currentTimeInMillis() - minutesAgoInMillis
  }
}
