//
//  Singleton.swift
//  Hackathon-trescoracoes
//
//  Created by Humberto Vieira de Castro on 1/29/16.
//  Copyright © 2016 Humberto Vieira de Castro. All rights reserved.
//

import Foundation

class Singleton: NSObject {
    
    var remetente: String?
    var bot: String?
    
    
    class var sharedInstance: Singleton {
        struct Static {
            static var instance: Singleton?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = Singleton()
        }
        return Static.instance!
    }
    
}
