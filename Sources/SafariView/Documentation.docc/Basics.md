# Displaying a Webpage

Display an in-app Safari window as a sheet.

## Overview

SafariView provides a quick and clean way of using a [SFSafariViewController][sfvc] from Safari Services with ease. This
article will discuss how to use SafariView to display a webpage as a sheet.

## Creating a Safari View

Creating a Safari view is as simple as adding the view to your view hierarchy:

```swift
@State private var destination: URL = .init(string: "https://www.apple.com")

var body: some View {
    SafariView(url: $destination)
}
```

> Note: Bindings are used in ``SafariView`` to allow the state to be updated correctly when the view enters the view
> hierarchy for the first time. This also allows developers to change the URL at any given time.

``SafariView/SafariView`` also displays a "Done" button that, when tapped, dismisses the sheet.

## Configuring a Safari View

``SafariView`` also exposes configurations hosted in [SFSafariViewController.Configuration][sfvc_o] as modifiers, making
it easy to quickly customize your Safari view. You can apply any of these modifiers in any order without consequence.

For example, to turn on Reader Mode automatically in your Safari view, add the
``SafariView/SafariView/prefersReaderMode(_:)`` modifier:

```swift
SafariView(url: $destination)
    .prefersReaderMode(.constant(true))
```

Likewise, to automatically collapse the toolbar when the user scrolls in the Safari view, add the 
``SafariView/SafariView/collapsible(_:)`` modifier:

```swift
SafariView(url: $destination)
    .collapsible(.constant(true))
```

> Note: Bindings are also used on ``SafariView/SafariView``'s modifiers to make it easier to adjust based on
> state changes.

## Example: Display as a Sheet

The following provides a great example of displaying a website using a ``SafariView/SafariView`` to redirect a user
through a sheet.

```swift
var HelpButton: some View {
    @State private var url = URL(string: "https://www.example.com")
    @State private var showHelp = false
    @State private var collapseBar = true

    var body: some View {
        Button {
            showHelp.toggle()
        } label: {
            Label("Get Help", systemImage: "question.circle")
        }
        .sheet(isPresented: $showHelp) {
            SafariView(url: $url)
                .collapsible($collapseBar)
        }
    }
}
```

> Important: Be sure to follow the recommendations and guidelines presented in the documentation for
> [SFSafariViewController][sfvc]. ``SafariView/SafariView`` should never be used to track a user without their consent
> or be hidden or obstructed by other views.

## Topics

### Views

- ``SafariView/SafariView``

### Configurations

- ``SafariView/SafariView/prefersReaderMode(_:)``
- ``SafariView/SafariView/collapsible(_:)``

[sfvc]: https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller
[sfvc_o]: https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/configuration
