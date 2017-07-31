//
//  Stack.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public class Stack<Element> : NSObject {
    
    fileprivate var objects : Array<Element> = Array<Element>()
    
    public var count : Int {
        return objects.count
    }
    
    public var first : Element? {
        return objects.first
    }
    
    public var last : Element? {
        return objects.last
    }
    
    public func next(of object: Element?) -> Element?{ guard let _ = object else { return nil}
        notImplementedYet()
    }
    
    public func previous(of object : Element?) -> Element?{ guard let _ = object else { return nil}
        notImplementedYet()
    }
    
    public func push(object : Element?) { guard let object = object else { return }
        objects.append(object)
    }
    
    public func pop() -> Element? {
        return objects.remove(at: objects.count - 1)
    }
    
}
