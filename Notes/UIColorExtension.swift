//
//  UIColorExtension.swift
//  Notes
//
//  Created by Aleksandra Nikiforova on 28/01/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        let alpha = CGFloat(rgb & 0x000000ff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
