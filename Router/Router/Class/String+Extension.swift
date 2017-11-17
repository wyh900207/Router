//
//  String+Extension.swift
//  Router
//
//  Created by HomerLynn on 2017/11/17.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

import Foundation

extension String {
    // "hello:url?pra1=123&two=132"
    struct RouterQuerys {
        var url: String?
        var params: String?
    }
    
    var querys: RouterQuerys {
        get {
            return self.parseToQuerys()
        }
    }
    
    func parseToQuerys() -> RouterQuerys {
        let querys = self.components(separatedBy: ":")
        if querys.count != 2 {
            fatalError("解析url失败, 请检查url格式是否正确")
        }
        return RouterQuerys(url: querys.first, params: querys.last)
    }
}
