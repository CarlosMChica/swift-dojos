import Foundation

class PostRepository {

  private var posts = [Post]()

  func timelineOf(user: User) -> [Post] {
    return posts.filter {
      $0.user == user
    }
  }

  func store(post: Post) {
    posts.append(post)
  }
}
