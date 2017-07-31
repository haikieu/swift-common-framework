//
//  Model.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

open class Model<VM,D> : NSObject {
    
    public var viewModel : VM!
    public var dataModal : BindingType<D>?
    
    deinit {
        dataModal = nil
        viewModel = nil
    }
    
    open func load(fromIndex index:Int = 0, totals: Int = -1) {
        notImplementedYet()
    }
    
    open func save(record : D) {
        notImplementedYet()
    }
    
    open func edit(record : D) {
        notImplementedYet()
    }
    
    open func delete(record : D) {
        let a = [record]
        notImplementedYet()
    }
    
    open func synchronize() {
        notImplementedYet()
    }
}
