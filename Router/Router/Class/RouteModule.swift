//
//  RouteModule.swift
//  Router
//
//  Created by HomerLynn on 2017/11/3.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

public class RouteModule {
    
    static var urls = [String: AnyClass]()
    
    static func regist(with type: String, url: AnyClass) {
        urls[type] = url
    }
    
    static func regist(with routes: [String : AnyClass]) {
        for (key, value) in routes {
            urls[key] = value
        }
    }
    
    static func remove(with route: String) {
        urls.removeValue(forKey: route)
    }
    
    static func remove(with routes: [String]) {
        for route in routes {
            urls.removeValue(forKey: route)
        }
    }
}
