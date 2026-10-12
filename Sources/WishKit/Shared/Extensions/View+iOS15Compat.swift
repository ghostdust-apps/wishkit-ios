//
//  View+iOS15Compat.swift
//  wishkit-ios
//
//  iOS 15 fallbacks for the iOS 16 SwiftUI APIs WishKit uses.
//

import SwiftUI

struct CompatNavigationStack<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            NavigationStack(root: content)
        } else {
            #if os(macOS)
            NavigationView(content: content)
            #else
            NavigationView(content: content)
                .navigationViewStyle(.stack)
            #endif
        }
    }
}

extension View {
    #if os(iOS)
    @ViewBuilder
    func compatScrollDismissesKeyboardInteractively() -> some View {
        if #available(iOS 16.0, *) {
            self.scrollDismissesKeyboard(.interactively)
        } else {
            self
        }
    }
    #endif

    @ViewBuilder
    func compatScrollContentBackgroundHidden(_ hidden: Bool) -> some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            self.scrollContentBackground(hidden ? .hidden : .automatic)
        } else {
            self
        }
    }
}
