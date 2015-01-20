//
//  WebLinking.swift
//  WebLinking
//
//  Created by Kyle Fuller on 20/01/2015.
//  Copyright (c) 2015 Cocode. All rights reserved.
//

import Foundation

/// A structure representing a RFC 5988 link.
public struct Link: Equatable, Hashable {
  public let uri:String
  public let parameters:[String:String]

  public init(uri:String, parameters:[String:String] = [:]) {
    self.uri = uri
    self.parameters = parameters
  }

  public var hashValue:Int {
    return uri.hashValue
  }

  /// Relation type of the Link.
  public var relationType:String? {
    return parameters["rel"]
  }

  /// Reverse relation of the Link.
  public var reverseRelationType:String? {
    return parameters["rev"]
  }

  /// A hint of what the content type for the link may be.
  public var type:String? {
    return parameters["type"]
  }
}

public func ==(lhs:Link, rhs:Link) -> Bool {
  return lhs.uri == rhs.uri && lhs.parameters == rhs.parameters
}
