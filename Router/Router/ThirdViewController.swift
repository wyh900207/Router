//
//  ThirdViewController.swift
//  Router
//
//  Created by HomerLynn on 2017/11/20.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var url: String?
    private var paramOne: String = ""
    private var paramTwo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("param_one is \(paramOne), param_two is \(paramTwo)")
        
        view.backgroundColor = UIColor.white
    }

}

extension ThirdViewController: RouterUrlProtocol {
    func setup(with url: String) {
        guard let params = url.parseToQueries().params else {
            print("url is null, please check the url")
            return
        }
        if let paramOne = params["paramOne"], let paramTwo = params["paramTwo"] {
            self.paramOne = paramOne as! String
            self.paramTwo = paramTwo as! String
        }
    }
}
