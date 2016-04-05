struct User: Equatable {

  let name: String

  init(name: String) {
    self.name = name
  }

}

func ==(lhs: User, rhs: User) -> Bool {
  return lhs.name == rhs.name
}
