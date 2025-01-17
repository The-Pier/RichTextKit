//
//  RichTextViewComponent+Alignment.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-29.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

public extension RichTextViewComponent {

    /**
     Use the selected range (if any) or text position to get
     the current rich text alignment.
     */
    var currentRichTextAlignment: RichTextAlignment? {
        let attribute: NSMutableParagraphStyle? = currentRichTextAttribute(.paragraphStyle)
        guard let style = attribute else { return nil }
        return RichTextAlignment(style.alignment)
    }

    /**
     Use the selected range (if any) or text position to set
     the current rich text alignment.

     - Parameters:
       - alignment: The alignment to set.
     */
    func setCurrentRichTextAlignment(
        to alignment: RichTextAlignment
    ) {
        if !hasTrimmedText {
            return setTextAlignmentAtCurrentPosition(to: alignment)
        }
        setRichTextAlignment(alignment, at: selectedRange)
    }
}

private extension RichTextViewComponent {

    func setTextAlignmentAtCurrentPosition(
        to alignment: RichTextAlignment
    ) {
        let style = NSMutableParagraphStyle()
        style.alignment = alignment.nativeAlignment
        var attributes = currentRichTextAttributes
        attributes[.paragraphStyle] = style
        typingAttributes = attributes
    }
}
