class PostRepositorySpy: PostRepository {

  var storeCalled = false
  var timelineOfCalled = false

  var storedPost: Post!
  var timelineLoadedOfUser: User!

  override func store(post: Post) {
    storeCalled = true
    storedPost = post
  }

  override func timelineOf(user: User) -> [Post] {
    timelineOfCalled = true
    timelineLoadedOfUser = user
    return super.timelineOf(user)
  }

}
