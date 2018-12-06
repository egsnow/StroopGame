////
////  LabelWithAdaptiveTextHeight.swift
////  Stroop Game
////
////  Created by Eric Snow on 12/6/18.
////  Copyright © 2018 Eric Snow. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class LabelWithAdaptiveTextHeight: UILabel {
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        font = fontToFitHeight()
//    }
//    
//    // Returns an UIFont that fits the new label's height.
//    private func fontToFitHeight() -> UIFont {
//        
//        var minFontSize: CGFloat = 18.0 // CGFloat 18
//        var maxFontSize: CGFloat = 67.0     // CGFloat 67
//        var fontSizeAverage: CGFloat = 0
//        var textAndLabelHeightDiff: CGFloat = 0
//        
//        while (minFontSize <= maxFontSize) {
//            
//            fontSizeAverage = minFontSize + (maxFontSize - minFontSize) / 2
//            
//            // Abort if text happens to be nil
//            guard text?.characters.count > 0 else {
//                break
//            }
//            
//            if let labelText: NSString = text {
//                let labelHeight = frame.size.height
//                
//                let testStringHeight = labelText.sizeWithAttributes(
//                    [NSFontAttributeName: font.fontWithSize(fontSizeAverage)]
//                    ).height
//                
//                textAndLabelHeightDiff = labelHeight - testStringHeight
//                
//                if (fontSizeAverage == minFontSize || fontSizeAverage == maxFontSize) {
//                    if (textAndLabelHeightDiff < 0) {
//                        return font.fontWithSize(fontSizeAverage - 1)
//                    }
//                    return font.fontWithSize(fontSizeAverage)
//                }
//                
//                if (textAndLabelHeightDiff < 0) {
//                    maxFontSize = fontSizeAverage - 1
//                    
//                } else if (textAndLabelHeightDiff > 0) {
//                    minFontSize = fontSizeAverage + 1
//                    
//                } else {
//                    return font.fontWithSize(fontSizeAverage)
//                }
//            }
//        }
//        return font.fontWithSize(fontSizeAverage)
//    }
//}
