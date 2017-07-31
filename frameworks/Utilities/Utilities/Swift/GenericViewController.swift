//
//  BasicViewController.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

open class GenericViewController<V : GenericView> : UIViewController {
    
    open override func loadView() {
        if V.isSubclass(of: GenericView.self) {
            
            if let nibName = V.nibName {
                let view = UINib.init(nibName: nibName, bundle: V.bunble).instantiate(withOwner: nil, options: nil).last as! UIView
                self.view = view
            } else {
                self.view = V()
                self.view.frame = UIScreen.main.bounds
            }
            
        } else {
            super.loadView()
        }
    }
    
}
