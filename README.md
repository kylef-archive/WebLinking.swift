Web Linking
===========

Swift implementation of Web Linking ([RFC5988](https://tools.ietf.org/html/rfc5988)).

## Installation

[CocoaPods](http://cocoapods.org/) is the recommended installation method.

```ruby
pod 'WebLinking'
```

## Example

Given the following `Link` header on an `NSHTTPURLResponse`.

```
Link: <https://api.github.com/user/repos?page=3&per_page=100>; rel="next",
      <https://api.github.com/user/repos?page=50&per_page=100>; rel="last"
```

We can find the next link on a response:

```swift
if let link = response.findLink(relation: "next") {
  println("We have a next link with the URI: \(link.uri).")
}
```

Or introspect all available links:

```swift
for link in response.links {
  println("We have a link with the relation: \(link.relationType) to \(link.uri).")
}
```

## License

Web Linking is licensed under the MIT license. See [LICENSE](LICENSE) for more
info.

