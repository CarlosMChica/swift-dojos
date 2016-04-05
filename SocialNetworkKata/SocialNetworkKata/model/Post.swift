struct Post: Equatable {

  private let user: User
  private let message: String

  init(user: User, message: String) {
    self.user = user
    self.message = message
  }
}

func ==(lhs: Post, rhs: Post) -> Bool {
  return lhs.message == rhs.message &&
      lhs.user == rhs.user
}
