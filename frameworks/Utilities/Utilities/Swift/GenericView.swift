//
//  GenericView.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

open class GenericView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open static var nibName : String? {
        return nil
    }
    
    open static var bunble : Bundle? {
        return nil
    }
    
}
