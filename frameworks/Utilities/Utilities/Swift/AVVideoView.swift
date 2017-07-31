//
//  AVPlayerView.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

public class AVVideoView : UIView {
    
    override public class var layerClass: Swift.AnyClass
    {
        get
        {
            return AVPlayerLayer.self
        }
    }
    
    public var player: AVPlayer? {
        
        get {
            return (self.layer as? AVPlayerLayer)?.player
        }
        set {
            
            (self.layer as? AVPlayerLayer)?.player = newValue
        }
    }
}
