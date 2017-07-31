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
        
        let index = self.index(of: object)
        if index > 0 {
            remove(at: index)
            return index
        }
        return -1
    }
    
    public func contains(object : AnyObject?) -> Bool { guard let object = object else {   return false }
        
        return index(of: object) > -1
    }
    
    
    public func index(of object: AnyObject?) -> Int { guard let object = object else {   return -1}
    
        if let index = index(where: { $0 === object }) {
            return index
        }
        return -1
    }
}
