# ``SafariView/SafariView``

## Overview

SafariView is a wrapper around the [SFSafariViewController][sfvc] view in the Safari Services framework designed to
handle state changes. Internally, it uses the ``RawSafariView`` to create the SwiftUI-compatible view and shadows the
same configuration options found in [SFSafariViewController.Configuration][sfvc_o].

## See Also

- <doc:Basics>
- ``RawSafariView``

## Topics

### Creating a Safari View

- ``init(url:)``

### View Modifiers

- ``prefersReaderMode(_:)``
- ``collapsible(_:)``

[sfvc]: https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller
[sfvc_o]: https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/configuration
