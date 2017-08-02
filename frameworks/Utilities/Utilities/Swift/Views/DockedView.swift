//
//  DockedView.swift
//  Utilities
//
//  Created by Kieu, Hai N on 7/20/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit

public enum DockedPosition {
    case unknown, topLeft, topRight, bottomLeft, bottomRight
}

open class DockedView : UIView, Dockable, Focusable {
    
    public var lastDockedPosition: BindingType<DockedPosition> = BindingType<DockedPosition>.init(withValue: .unknown)
    
    public var originPosition: CGPoint?
    
    public var topOffset : CGFloat = UIApplication.shared.statusBarFrame.height
    public var bottomOffset : CGFloat = 0
    public var margin : CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDraggable(enable: true)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDraggable(enable: true)
    }
    
    deinit {
        setDraggable(enable: false)
    }
    
}
