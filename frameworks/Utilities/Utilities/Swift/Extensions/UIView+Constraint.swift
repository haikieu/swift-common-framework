//
//  UIView+Constraint.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit
public extension UIView {
    
    public func autoresizeFullSuperView() {
        guard let superview = self.superview else {
            return //There no superview
        }
        self.translatesAutoresizingMaskIntoConstraints = true
        self.frame = superview.bounds
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    public func layoutFullSuperview() {
        guard let superview = self.superview else {
            return //There no superview
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: [], metrics: nil, views: ["view":self])
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: [], metrics: nil, views: ["view":self])
        NSLayoutConstraint.activate(constraints)
    }
    
    public func deactivateConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints += self.constraints
        if let superview = self.superview {
            constraints += superview.constraints
        }
        
        for constraint in constraints {
            if constraint.firstItem === self || constraint.secondItem === self {
                constraint.isActive = false
            }
        }
    }

    public var widthConstraint : NSLayoutConstraint? {
        
        for constraint in self.constraints {
            if constraint.firstItem === self && constraint.firstAttribute == .width {
                return constraint
            }
        }
        
        return nil
    }
    
    public var heightConstraint : NSLayoutConstraint? {
        for constraint in self.constraints {
            if constraint.firstItem === self && constraint.firstAttribute == .height {
                return constraint
            }
        }
        
        return nil
    }
    
    public var centerXConstraint : NSLayoutConstraint? {
        
        for constraint in self.constraints {
            if constraint.firstItem === self && constraint.firstAttribute == .centerX {
                return constraint
            }
        }
        
        return nil
    }
    
    public var centerYConstraint : NSLayoutConstraint? {
        
        for constraint in self.constraints {
            if constraint.firstItem === self && constraint.firstAttribute == .centerY {
                return constraint
            }
        }
        
        return nil
    }
    
    public var topConstraint : NSLayoutConstraint? {
        return nil
    }
    
    public var bottomConstraint : NSLayoutConstraint? {
        return nil
    }
    
    public var leadingConstraint : NSLayoutConstraint? {
        return nil
    }
    
    public var trailingConstraint : NSLayoutConstraint? {
        return nil
    }
}
