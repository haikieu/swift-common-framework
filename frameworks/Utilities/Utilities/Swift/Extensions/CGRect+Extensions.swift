//
//  CGRect+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation


public extension UIView {
    
    public var x : CGFloat { return self.frame.x }
    
    public var y : CGFloat { return self.frame.y }
    
    public var width : CGFloat { return self.frame.width }
    
    public var height : CGFloat { return self.frame.height }
    
    public var topLeft : CGPoint { return self.frame.topLeft }
    public var topRight : CGPoint { return self.frame.topRight }
    public var bottomLeft : CGPoint { return self.frame.bottomLeft }
    public var bottomRight : CGPoint { return self.frame.bottomRight }
}

public extension CGRect {
    public var x : CGFloat {
        get {
            return origin.x
        }
        set {
            self.origin.x = newValue
        }
    }
    
    public var y : CGFloat {
        get {
            return origin.y
        }
        set {
            self.origin.y = newValue
        }
    }
    
    public var width : CGFloat {
        get {
            return size.width
        }
        set {
            self.size.width = newValue
        }
    }
    
    public var height : CGFloat {
        get {
            return size.height
        }
        set {
            self.size.height = newValue
        }
    }
    
    public var center : CGPoint { return CGPoint.init(x: midX, y: midY) }
    public var topLeft : CGPoint { return CGPoint.init(x: minX, y: minY) }
    public var topRight : CGPoint { return CGPoint.init(x: maxX, y: minY) }
    public var bottomLeft : CGPoint { return CGPoint.init(x: minX, y: maxY) }
    public var bottomRight : CGPoint { return CGPoint.init(x: maxX, y: maxX) }
}
