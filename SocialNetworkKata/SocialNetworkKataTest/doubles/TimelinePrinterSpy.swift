class TimelinePrinterSpy: TimelinePrinter {

  var postsPrinted = [Post]()

  init() {
    super.init(view: ViewSpy())
  }

  override func print(posts: [Post]) {
    postsPrinted = posts
  }

}
