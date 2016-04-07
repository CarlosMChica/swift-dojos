class PostRepositorySpy: PostRepository {

  var storeCalled = false
  var storedPost: Post!
  var timelineOfCalled = false
  var timelineLoadedOfUser: User!

  let timelinePosts: [Post]

  override init() {
    timelinePosts = [Post]()
  }

  init(posts: [Post]) {
    self.timelinePosts = posts
  }

  override func store(post: Post) {
    storeCalled = true
    storedPost = post
  }

  override func timelineOf(user: User) -> [Post] {
    timelineOfCalled = true
    timelineLoadedOfUser = user
    return timelinePosts
  }

}
