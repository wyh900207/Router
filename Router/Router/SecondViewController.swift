//
// Created by HomerLynn on 2017/11/20.
// Copyright (c) 2017 HomerLynn. All rights reserved.
//

import UIKit

extension Selector {
    static let buttonTapped = #selector(SecondViewController.buttonTapped)
}

class SecondViewController: UIViewController {
    var url: String?
    @objc private var hello: String = ""
    @objc private var world: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white;
        let button = UIButton()
        button.backgroundColor = UIColor.orange;
        button.center = view.center;
        button.bounds = CGRect(x: 0, y: 0, width: 100, height: 100);
        button.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        view.addSubview(button)

        setup(with: url)
        print("hello is : \(hello), world is : \(world)")
    }

    @objc func buttonTapped() {
        print("Second ViewControler button tapped!")
        let thirdVC = ThirdViewController()
        thirdVC.url = "https://ThirdViewController?paramOne=123&paramTwo=5232432432fsafds"
        navigationController?.pushViewController(thirdVC, animated: true)
    }
}

extension SecondViewController: RouterUrlProtocol  {
    func setup(with url: String?) {
        guard let params = url?.parseToQueries().params else {
            print("url is null, please check the url")
            return
        }
        if let hello = params["hello"], let world = params["world"] {
            self.hello = hello as! String
            self.world = world as! String
        }
    }
}
