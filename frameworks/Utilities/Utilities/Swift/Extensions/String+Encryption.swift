//
//  String+Encryption.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

fileprivate let prefix = "".h.k

public extension String {
    
    public var isEncrypted : Bool {
        return self.contains(prefix)
    }
    
    public var encryptedValue : String {
        
        if isEncrypted {
            return self
        } else {
            return encrypt(string: self)
        }
    }
    
    public var decryptedValue : String {

        if isEncrypted {
            return decrypt(string: self)
        } else {
            return self
        }
    }
    
    fileprivate func encrypt(string: String, prefix : String = prefix) -> String {
        
        return prefix.appending(string) //Need to encrypt string
    }
    
    fileprivate func decrypt(string: String, prefix : String = prefix) -> String {
        notImplementedYet()
//        return string.trimmingCharacters(in: CharacterSet.init(charactersIn: prefix))
    }
    
}
