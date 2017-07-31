//
//  Date+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public extension Date {
    public static var timeStamp : TimeInterval {
        // Get the Unix timestamp
        let timestamp = NSDate().timeIntervalSince1970
        return timestamp
    }
}

public extension String {
    public static var timeStamp : String {
        // Get the Unix timestamp
        return "\(Date.timeStamp)"
    }
    
    public var dateValue : Date? {
        guard let interval = TimeInterval.init(self) else { return nil}
        return interval.dateValue
    }
}

public extension TimeInterval {
    public var dateValue : Date {
        return Date.init(timeIntervalSince1970: self)
    }
}
