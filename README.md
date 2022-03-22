# SafariView

SafariView is a small Swift package for iOS that adds a SwiftUI bridge to `SafariViewController`.

## Getting Started

`SafariView` can be easily installed through the Swift Package Manager in any Xcode project. To add `SafariView` to your
package in Xcode 13, go to **File › Swift Packages › Add Package Dependency...** and paste in the URL:
`https://github.com/alicerunsonfedora/SafariView`.


## Example Usage

This example demonstrates how to open a `SafariView` when the user taps a button on iOS:

```swift
import SafariView
import SwiftUI

struct ExampleView: View {
    
    @State private var destination: URL = .init(string: "https://www.apple.com")
    @State private var showSafari: Bool = false

    var body: some View {
        VStack {
            Button {
                showSafari.toggle()
            } label: {
                Text("Go to Apple.com!")
            }
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url: $destination)
                .collapsible(.constant(true))
        }
    }
}
```
