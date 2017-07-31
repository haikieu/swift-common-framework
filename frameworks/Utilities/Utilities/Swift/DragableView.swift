//
//  DragableView.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit

open class DraggableView : UIView, Draggable {
    
    public var originPosition: CGPoint?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setDraggable(enable: true)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDraggable(enable: true)
    }
    
    deinit {
        setDraggable(enable: false)
    }
}
