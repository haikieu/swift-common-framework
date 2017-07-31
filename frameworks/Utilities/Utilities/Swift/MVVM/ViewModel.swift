//
//  ViewModel.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

open class ViewModel<V,M> : NSObject {
    
    open var view : BindingType<V>?
    open var model : BindingType<M>?
    
    deinit {
        view = nil
        model = nil
    }
}
