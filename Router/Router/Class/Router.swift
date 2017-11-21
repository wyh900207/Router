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
    
    func push(to url: String) -> Void {
        guard let className = Bundle.main.infoDictionary?["CFBundleExecutable"] else {
            return
        }
        let cls: AnyClass? = NSClassFromString(className as! String + "." + url.parseToQueries().url!)
        if cls is RouterUrlProtocol.Type {
            guard let clsType = cls as? UIViewController.Type else { return }
            let destinationViewController = clsType.init()
            //destinationViewController.setup(with: url)
            getTopViewController(current: nil)?.navigationController?.pushViewController(destinationViewController, animated: true)
        }
    }
    
    
    

}

extension Router {
    func getTopViewController(current viewController: UIViewController?) -> UIViewController? {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        let topViewController = viewController ?? rootViewController
        
        switch topViewController {
        case is UITabBarController:
            if let top = (topViewController as! UITabBarController).selectedViewController {
                return getTopViewController(current: top)
            } else {
                return nil
            }
        case is UINavigationController:
            if let top = (topViewController as! UINavigationController).topViewController {
                return getTopViewController(current: top)
            } else {
                return nil
            }
        default:
            return topViewController.presentedViewController ?? topViewController
        }
    }
}
