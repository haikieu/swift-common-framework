//
//  Draggable.swift
//  Utilities
//
//  Created by Kieu, Hai N on 7/20/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

//Animation config
let duration : TimeInterval = 0.2
let delay : TimeInterval = 0
let borderWith : CGFloat = 2
let borderColor : UIColor = .green
var globalPanGestures = [Int:UIPanGestureRecognizer]()
let screenSize : CGRect = UIScreen.main.bounds

public class PanGestureRecognizer : UIPanGestureRecognizer {
    
    var focusable : Bool = false
    
    var draggable : Bool {
        if let view = self.view, view is Draggable {
            return true
        } else {
            return false
        }
    }
    
    var dockable : Bool {
        if let view = self.view, view is Dockable {
            return true
        } else {
            return false
        }
    }
}

public protocol AttachGesture : class {
    func findGesture() -> PanGestureRecognizer?
}

extension AttachGesture where Self : UIView {
    public func findGesture() -> PanGestureRecognizer? {
        for gesture in self.gestureRecognizers ?? [] {
            if let panGesture = gesture as? PanGestureRecognizer {
                return panGesture
            }
        }
        return nil
    }
}

public protocol Draggable : AttachGesture {
    
    var originPosition : CGPoint? { get set }
    
    func setDraggable(enable: Bool)
    //    func handlePanGesture(_ gesture : UIPanGestureRecognizer)
    
    ///Internal delegate for handling in subclass
    func shouldMove(to position: CGPoint, current state: UIGestureRecognizerState) -> Bool
    ///Internal delegate for handling in subclass
    func shouldRevertOnFailure(from lastPosition: CGPoint, to originPosition: CGPoint, current state: UIGestureRecognizerState) -> Bool
    ///Internal delegate for handling in subclass
    func onBeganMoving(from originPosition: CGPoint)
    ///Internal delegate for handling in subclass
    func onMoving(to position: CGPoint)
    ///Internal delegate for handling in subclass
    func onEndedMoving(from originPosition: CGPoint, to lastPosition: CGPoint)
    ///Internal delegate for handling in subclass
    func onReverting(from lastPosition: CGPoint, to originPosition: CGPoint, current state: UIGestureRecognizerState)
}

public extension Draggable where Self : UIView {
    
    func setDraggable(enable: Bool) {
        if enable {
            if findGesture() == nil {
                let gesture = PanGestureRecognizer.init(target: GlobalGestureHandler.shared, action: #selector(GlobalGestureHandler.handlePanGesture(_:)))
                self.addGestureRecognizer(gesture)
            }
        } else {
            if let gesture = findGesture() {
                removeGestureRecognizer(gesture)
            }
        }
    }
    
    ///Internal delegate for handling in subclass
    func shouldMove(to position: CGPoint, current state: UIGestureRecognizerState) -> Bool { return true }
    ///Internal delegate for handling in subclass
    func shouldRevertOnFailure(from lastPosition: CGPoint, to originPosition: CGPoint, current state: UIGestureRecognizerState) -> Bool { return false }
    ///Internal delegate for handling in subclass
    func onBeganMoving(from originPosition: CGPoint) {}
    ///Internal delegate for handling in subclass
    func onMoving(to position: CGPoint) {}
    ///Internal delegate for handling in subclass
    func onEndedMoving(from originPosition: CGPoint, to lastPosition: CGPoint) {}
    ///Internal delegate for handling in subclass
    func onReverting(from lastPosition: CGPoint, to originPosition: CGPoint, current state: UIGestureRecognizerState) {}
}
