//
//  UIColor+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

fileprivate let minColor : CGFloat = 0
fileprivate let maxColor : CGFloat = 255
fileprivate let minAlpha : CGFloat = 0
fileprivate let maxAlpha : CGFloat = 1

public extension UIColor {
    
    static func color(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> UIColor {
    
        var red = max(r, minColor) //Check if red is less than 0
        red = min(red, maxColor)    //Check if red is greater than 255
        
        var green = max(g,minColor)
        green = min(green, maxColor)
        
        var blue = max(b,minColor)
        blue = min(blue, maxColor)
        
        var alpha = max(a, minColor)
        alpha = min(alpha, maxColor)
    
        return UIColor.init(red: red/maxColor, green: green/maxColor, blue: blue/maxColor, alpha: alpha)
    }
    
}
