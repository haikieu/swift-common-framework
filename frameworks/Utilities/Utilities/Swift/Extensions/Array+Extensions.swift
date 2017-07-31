//
//  Array+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public extension Array where Element: AnyObject{
    
    public mutating func remove(object: AnyObject?) -> Int { guard let object = object else {   return -1 }
        
        if let index = index(ofObject: object) as? Int, index > 0 {
            remove(at: index)
            return index
        }
        return -1
    }
    
    public func contains(object : AnyObject?) -> Bool { guard let object = object else {   return false }
        
        return index(ofObject: object) > -1
    }
    
    
    public func index(ofObject object: AnyObject?) -> Int { guard let object = object else {   return -1}
    
        if let index = index(where: { $0 === object }) {
            return index
        }
        return -1
    }
}
