//
//  ViewController.swift
//  Router
//
//  Created by HomerLynn on 2017/11/3.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RouteAble {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https:www.baidu.com"
        let routerQuerys = url.parseToQuerys()
        guard let urls = routerQuerys.url,
            let params = routerQuerys.params else {
                fatalError("error")
        }
        print("url is : \(urls), params is : \(params)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
