//
//  Queue.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public class Queue<Element> : NSObject {
    
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
    
    public func next(OfObject object: Element?) -> Element?{ guard let object = object else { return nil}
        notImplementedYet()
    }
    
    public func previous(OfObject object : Element?) -> Element?{ guard let object = object else { return nil}
        notImplementedYet()
    }
}
