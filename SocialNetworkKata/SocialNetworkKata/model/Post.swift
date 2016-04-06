struct Post: Equatable {

  let user: User
  let message: String
  let timestamp: CLong

  init(user: User, message: String, timestamp: CLong) {
    self.user = user
    self.message = message
    self.timestamp = timestamp
  }
}

func ==(lhs: Post, rhs: Post) -> Bool {
  return lhs.message == rhs.message &&
      lhs.user == rhs.user
}
