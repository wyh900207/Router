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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let url = "https://SecondViewController?hello=123&world=234"
        let secondVC = SecondViewController()
        secondVC.url = url
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
