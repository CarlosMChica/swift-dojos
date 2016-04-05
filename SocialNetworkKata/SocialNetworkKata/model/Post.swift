struct Post: Equatable {

  let user: User
  let message: String

  init(user: User, message: String) {
    self.user = user
    self.message = message
  }
}

func ==(lhs: Post, rhs: Post) -> Bool {
  return lhs.message == rhs.message &&
      lhs.user == rhs.user
}
