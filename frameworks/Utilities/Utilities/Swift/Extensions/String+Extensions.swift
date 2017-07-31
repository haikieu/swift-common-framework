//
//  String+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/8/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public extension String {
    public func log() {
        print("\(Date.init()) [Debug] \(self)")
    }
    
    public func preppending(string: String) -> String {
        return string.appending(self)
    }
    
    public func leftTrim(string: String) -> String {
        notImplementedYet()
    }
    
    public func rightTrim(string: String) -> String {
        notImplementedYet()
    }
    
    public var intValue : Int? {
        return Int.init(self)
    }
    
    public var floatValue : Float? {
        return Float.init(self)
    }
    
    public var doubleValue : Double? {
        return Double.init(self)
    }
}
