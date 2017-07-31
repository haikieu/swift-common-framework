//
//  Tree.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public protocol TreeNote {
    
}

public protocol BinaryNote : TreeNote {
    
}

public class Tree<Note : TreeNote> : NSObject {

    public internal(set) var rootNote : Note!
    
    init(withRoot root: Note) {
        super.init()
        rootNote = root
    }
}
