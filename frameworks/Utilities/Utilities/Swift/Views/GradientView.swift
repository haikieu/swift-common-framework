//
//  GradientView.swift
//  Utilities
//
//  Created by Hai Kieu on 8/1/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import UIKit

class GradientView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override var layer: CAGradientLayer {
        return super.layer as! CAGradientLayer
    }
    
    override public class var layerClass: Swift.AnyClass {
        get {
            return CAGradientLayer.self
        }
    }

    /* The array of CGColorRef objects defining the color of each gradient
     * stop. Defaults to nil. Animatable. */
    
    open var colors: [Any]? {
        get {
             return layer.colors
        }
        set {
            layer.colors = colors
        }
    }
    
    
    /* An optional array of NSNumber objects defining the location of each
     * gradient stop as a value in the range [0,1]. The values must be
     * monotonically increasing. If a nil array is given, the stops are
     * assumed to spread uniformly across the [0,1] range. When rendered,
     * the colors are mapped to the output colorspace before being
     * interpolated. Defaults to nil. Animatable. */
    
    open var locations: [NSNumber]? {
        get {
            return layer.locations
        }
        set {
            layer.locations = locations
        }
    }
    
    
    /* The start and end points of the gradient when drawn into the layer's
     * coordinate space. The start point corresponds to the first gradient
     * stop, the end point to the last gradient stop. Both points are
     * defined in a unit coordinate space that is then mapped to the
     * layer's bounds rectangle when drawn. (I.e. [0,0] is the bottom-left
     * corner of the layer, [1,1] is the top-right corner.) The default values
     * are [.5,0] and [.5,1] respectively. Both are animatable. */
    
    open var startPoint: CGPoint {
        get {
            return layer.startPoint
        }
        set {
            layer.startPoint = startPoint
        }
    }
    
    open var endPoint: CGPoint {
        get {
            return layer.endPoint
        }
        set {
            layer.endPoint = endPoint
        }
    }
    
    
    /* The kind of gradient that will be drawn. Currently the only allowed
     * value is `axial' (the default value). */
    
    open var type: String {
        get {
            return layer.type
        }
        set {
            layer.type = type
        }
    }
}
