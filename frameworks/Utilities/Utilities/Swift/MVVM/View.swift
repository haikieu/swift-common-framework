//
//  View.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation


open class View<V : UIViewController,VM> : NSObject {
 
    open var viewModel : VM!
    
    deinit {

        viewModel = nil
    }
}
