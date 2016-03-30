class OutputFormatterStub: OutputFormatter {

  let content : String

  init(content: String) {
    self.content = content
  }

  func format(number: Int) -> String {
    return content
  }

}