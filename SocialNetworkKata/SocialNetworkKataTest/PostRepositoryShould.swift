import XCTest

class PostRepositoryShould: XCTestCase {

  private let aMessage = "message"
  private let repository = PostRepository()

  func test_return_empty_timeline_for_user_without_posts() {
    let aUser = givenAUser()

    let timeline = repository.timelineOf(aUser)

    XCTAssertTrue(timeline.isEmpty)
  }

  func test_store_post() {
    let aUser = givenAUser()
    let aPost = givenAPostFrom(aUser)

    repository.store(aPost)

    let expectedPosts = [Post](arrayLiteral: aPost)
    XCTAssertEqual(expectedPosts, repository.timelineOf(aUser))
  }

  func test_only_return_user_timeline_posts() {
    let aUser = givenAUser()
    let anotherUser = givenAnotherUser()
    let aUserPost = givenAPostFrom(aUser)
    let anotherUserPost = givenAPostFrom(anotherUser)

    repository.store(aUserPost)
    repository.store(anotherUserPost)

    let expectedPost = [Post](arrayLiteral: aUserPost)
    XCTAssertEqual(expectedPost, repository.timelineOf(aUser))
  }

  func givenAPostFrom(user: User) -> Post {
    return Post(user: user, message: aMessage)
  }

  func givenAUser() -> User {
    return User(name: "userName")
  }

  func givenAnotherUser() -> User {
    return User(name: "anotherUserName")
  }
}
