//
//  Router.swift
//  Router
//
//  Created by HomerLynn on 2017/11/3.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

class Router {
    static let shared = Router()
    var modules = [String: RouteModule]()
    
    class func regist(_ module: [String: RouteModule]) {
        for (key, value) in module {
            shared.modules[key] = value
        }
    }
    
    class func remove(_ module: String) {
        shared.modules.removeValue(forKey: module)
    }
    
    class func remove(_ modules: [String]) {
        for key in modules {
            shared.modules.removeValue(forKey: key)
        }
    }
}
