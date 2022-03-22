//
//  SafariView.swift
//  SafariView
//
//  Created by Marquis Kurt on 22/3/22.
//

import Foundation
import SwiftUI

/// A view that displays a webpage inside of a Safari view controller.
@available(iOS 13.0, *)
public struct SafariView: View {

    /// The URL that the view will display.
    @Binding var url: URL?

    @Binding fileprivate var reader: Bool
    @Binding fileprivate var collapsed: Bool

    public init(url: Binding<URL?>) {
        self._url = url
        self._reader = .constant(false)
        self._collapsed = .constant(false)
    }

    fileprivate init(
        url: Binding<URL?>,
        prefersReaderMode reader: Binding<Bool>,
        collapsible collapses: Binding<Bool>
    ) {
        self._url = url
        self._reader = reader
        self._collapsed = collapses
    }

    /// The body of the view.
    public var body: some View {
        Group {
            if let destination = url {
                RawSafariView(destination)
                    .prefersReaderMode($reader)
                    .collapsible($collapsed)
            } else {
                VStack(spacing: 8) {
                    Image(systemName: "safari")
                    Text("Cannot Load Safari Link")
                }
                .font(.largeTitle)
                .foregroundColor(.secondary)
            }
        }
    }

    /// Sets whether the view should automatically enter Reader Mode, if possible.
    public func prefersReaderMode(_ readerMode: Binding<Bool>) -> SafariView {
        SafariView(url: $url, prefersReaderMode: readerMode, collapsible: $collapsed)
    }

    /// Sets whether the Safari toolbar should collapse when scrolling in the view.
    public func collapsible(_ collapsible: Binding<Bool>) -> SafariView {
        SafariView(url: $url, prefersReaderMode: $reader, collapsible: collapsible)
    }
}
