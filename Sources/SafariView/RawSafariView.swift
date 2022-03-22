//
//  RawSafariView.swift
//  SafariView
//
//  Created by Marquis Kurt on 20/1/22.
//

import Foundation
import SwiftUI
import SafariServices

/// A primitive view that creates a bridge of `SFSafariViewController`.
///
/// RawSafariView creates a bridge to an `SFSafariViewController` and exposes configurations available in
/// `SFSafariViewController.Configuration` as view modifiers. It is designed to provide an interface for the Safari
/// view controller using SwiftUI.
///
/// - Important: Generally, using ``SafariView/SafariView`` instead of RawSafariView is more ideal since it elevates
///   RawSafariView to also account for state management.
@available(iOS 13.0, *)
public struct RawSafariView: UIViewControllerRepresentable {

    /// The URL to load into the Safari view controller.
    public let url: URL

    /// Whether to enter reader mode by default.
    fileprivate let reader: Bool

    /// Whether to collapse the bar.
    fileprivate let collapseBar: Bool

    /// Creates an instance of a `SFSafariViewController` with the specified URL.
    /// - Parameter urlString: A string containing the URL the Safari view controller will open.
    public init(_ urlString: String) {
        self.init(urlString, reader: false, collapses: false)
    }

    /// Creates an instance of a `SFSafariViewController` with a string representing the specified URL to open.
    /// - Parameter url: The URL the Safari view controller will open.
    public init(_ url: URL) {
        self.init(url, reader: false, collapses: false)
    }

    fileprivate init(_ urlString: String, reader: Bool = false, collapses collapseBar: Bool = false) {
        self.url = URL(string: urlString)!
        self.reader = reader
        self.collapseBar = collapseBar
    }

    fileprivate init(_ url: URL, reader: Bool = false, collapses collapseBar: Bool = false) {
        self.url = url
        self.reader = reader
        self.collapseBar = collapseBar
    }

    /// Makes the `UIViewController` with the specified context applied.
    /// - Note: This was inherited from `UIViewControllerRepresentable.makeUIViewController`.
    public func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        let configuration = SFSafariViewController.Configuration()
        configuration.entersReaderIfAvailable = reader
        configuration.barCollapsingEnabled = collapseBar
        return SFSafariViewController(url: url, configuration: configuration)
    }

    /// Updates the `UIViewController` with the specified context applied.
    /// - Note: This was inherited from `UIViewControllerRepresentable.updateUIViewController`.
    public func updateUIViewController(
        _ uiViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<RawSafariView>
    ) {
        return
    }
}

extension RawSafariView {

    /// Sets whether Reader Mode should open automatically when the page loads.
    public func prefersReaderMode(_ prefersReaderMode: Binding<Bool>) -> RawSafariView {
        RawSafariView(self.url, reader: prefersReaderMode.wrappedValue, collapses: self.collapseBar)
    }

    /// Sets whether the browser bar automatically collapses when the user scrolls.
    public func collapsible(_ collapsible: Binding<Bool>) -> RawSafariView {
        RawSafariView(self.url, reader: self.reader, collapses: collapsible.wrappedValue)
    }
}
