//
//  WebLinkingTests.swift
//  WebLinkingTests
//
//  Created by Kyle Fuller on 20/01/2015.
//  Copyright (c) 2015 Cocode. All rights reserved.
//

import Foundation
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
    XCTAssertEqual(link.relationType!, "stylesheet")
  }

  func testHasReverseRelationType() {
    let link = Link(uri: "/style.css", parameters: ["rev": "document"])
    XCTAssertEqual(link.reverseRelationType!, "document")
  }

  func testHasType() {
    XCTAssertEqual(link.type!, "text/css")
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
