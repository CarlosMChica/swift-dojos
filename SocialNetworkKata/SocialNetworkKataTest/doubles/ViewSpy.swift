class ViewSpy: View {

  private var messagesPrinted = [String]()

  func printLine(line: String) {
    messagesPrinted.append(line)
  }

  func getMessagePrinted(number: Int) -> String {
    return messagesPrinted.count > number ? messagesPrinted[number] : ""
  }
}
