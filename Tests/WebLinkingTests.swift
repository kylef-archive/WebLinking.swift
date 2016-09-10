import XCTest
import WebLinking

class LinkTests: XCTestCase {
  var link:Link!

  override func setUp() {
    super.setUp()
    link = Link(uri: "/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])
  }

  func testHasURI() {
    XCTAssertEqual(link.uri, "/style.css")
  }

  func testHasParameters() {
    XCTAssertEqual(link.parameters, ["rel": "stylesheet", "type": "text/css"])
  }

  func testHasRelationType() {
    XCTAssertEqual(link.relationType, "stylesheet")
  }

  func testHasReverseRelationType() {
    let link = Link(uri: "/style.css", parameters: ["rev": "document"])
    XCTAssertEqual(link.reverseRelationType, "document")
  }

  func testHasType() {
    XCTAssertEqual(link.type, "text/css")
  }

  // MARK: Equatable

  func testEquatable() {
    let otherLink = Link(uri: "/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])
    XCTAssertEqual(link, otherLink)
  }

  // MARK: Hashable

  func testHashable() {
    let otherLink = Link(uri: "/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])
    XCTAssertEqual(link.hashValue, otherLink.hashValue)
  }
}

class LinkHeaderTests: XCTestCase {
  var link:Link!

  override func setUp() {
    super.setUp()
    link = Link(uri: "/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])
  }

  func testConversionToHeader() {
    XCTAssertEqual(link.header, "</style.css>; rel=\"stylesheet\"; type=\"text/css\"")
  }

  func testParsingHeader() {
    let parsedLink = Link(header: "</style.css>; rel=\"stylesheet\"; type=\"text/css\"")
    XCTAssertEqual(parsedLink, link)
  }

  func testParsingLinksHeader() {
    let links = parseLink(header: "</style.css>; rel=\"stylesheet\"; type=\"text/css\"")
    XCTAssertEqual(links[0], link)
    XCTAssertEqual(links.count, 1)
  }

  func testResponseLinks() {
    let url = URL(string: "http://test.com/")!
    let headers = [
      "Link": "</style.css>; rel=\"stylesheet\"; type=\"text/css\"",
    ]
    let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: headers)!
    let link = Link(uri: "http://test.com/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])

    XCTAssertEqual(response.links, [link])
  }

  func testResponseFindLinkParameters() {
    let url = URL(string: "http://test.com/")!
    let headers = [
      "Link": "</style.css>; rel=\"stylesheet\"; type=\"text/css\", </style.css>; rel=\"stylesheet\"; type=\"text/css\"",
    ]
    let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: headers)!
    let link = Link(uri: "http://test.com/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])
    let foundLink = response.findLink(["rel": "stylesheet"])!

    XCTAssertEqual(foundLink, link)
  }

  func testResponseFindLinkRelation() {
    let url = URL(string: "http://test.com/")!
    let headers = [
      "Link": "</style.css>; rel=\"stylesheet\"; type=\"text/css\", </style.css>; rel=\"stylesheet\"; type=\"text/css\"",
    ]
    let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: headers)!
    let link = Link(uri: "http://test.com/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])
    let foundLink = response.findLink(relation: "stylesheet")!

    XCTAssertEqual(foundLink, link)
  }
}

class LinkHTMLTests: XCTestCase {
  var link:Link!

  override func setUp() {
    super.setUp()
    link = Link(uri: "/style.css", parameters: ["rel": "stylesheet", "type": "text/css"])
  }

  func testConversionToHTML() {
    let html = "<link rel=\"stylesheet\" type=\"text/css\" href=\"/style.css\" />"
    XCTAssertEqual(link.html, html)
  }
}
