//
//  Focusable.swift
//  Utilities
//
//  Created by Kieu, Hai N on 7/20/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

fileprivate let TAG_OVERLAY_VIEW = 932

public protocol Focusable : AttachGesture {
    func enable(focusable: Bool)
    func focus()
    func unfocus()
}

public extension Focusable where Self : UIView {
    func enable(focusable: Bool) {
        
    }
    
    func focus() {
        guard let parent = self.superview else { return }
//        let overlay = UIView.init(frame: UIScreen.main.bounds)
        let overlay = UIVisualEffectView.init(effect: UIBlurEffect(style: .light))
        overlay.alpha = 0.3
        overlay.frame = UIScreen.main.bounds
        overlay.tag = TAG_OVERLAY_VIEW
//        overlay.backgroundColor = UIColor.black.withAlphaComponent(1)
        parent.insertSubview(overlay, belowSubview: self)
    }
    
    func unfocus() {
        guard let parent = self.superview else { return }
        var overlay : UIView!
        for view in parent.subviews {
            if view.tag == TAG_OVERLAY_VIEW {
                overlay = view
            }
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            overlay.alpha = 0
        }) { (Bool) in
            overlay.removeFromSuperview()
        }
    }
}
