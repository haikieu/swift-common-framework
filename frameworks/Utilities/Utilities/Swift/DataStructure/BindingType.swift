//
//  BindingType.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public typealias BindingCallback<Type> = ((_ newValue: Type?, _ oldValue: Type?) -> Void)

public class BindingType<Type> {
    
    public var callback : BindingCallback<Type>?
    
    public var value : Type?
    {
        didSet {
            callback?(value, oldValue)
        }
    }
    
    public init(withValue value: Type?, callback: BindingCallback<Type>? = nil) {
        
        self.callback = callback
        self.value = value
    }
    
    public init(withCallback callback: BindingCallback<Type>? = nil) {
        
        self.callback = callback
    }
}
