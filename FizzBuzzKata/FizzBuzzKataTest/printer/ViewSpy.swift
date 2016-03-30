class ViewSpy: View {

  var printCalled = false
  var printContent = ""

  func print(content: String) {
    printCalled = true
    printContent = content
  }

}
