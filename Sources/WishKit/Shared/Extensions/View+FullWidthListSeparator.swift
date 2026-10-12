//
//  View+FullWidthListSeparator.swift
//  wishkit-ios
//
//  Created by Martin Lasek on 5/26/26.
//  Copyright © 2026 Martin Lasek. All rights reserved.
//

#if !os(watchOS) && !os(tvOS)
import SwiftUI

extension View {
    @ViewBuilder
    func fullWidthListSeparator() -> some View {
        if #available(iOS 16.0, *) {
            self
                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                .alignmentGuide(.listRowSeparatorTrailing) { dimensions in dimensions.width }
        } else {
            self
        }
    }
}
#endif
