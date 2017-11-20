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
    struct RouterQueries {
        var scheme: String?
        var url: String?
        var params: [String: Any]?
    }

    var queries: RouterQueries {
        get {
            return self.parseToQueries()
        }
    }
    
    func parseToQueries() -> RouterQueries {
        if !self.contains("://") {
            fatalError("please check url")
        }
        let components = self.components(separatedBy: "://")
        guard components.count == 2,
              let scheme = components.first,
              let urlString = components.last else {
            fatalError("解析不要scheme或者url部分, 请检查url书写是否正确")
        }
        if !urlString.contains("?") {
            return RouterQueries(scheme: scheme, url: urlString, params: nil);
        }
        let urlComponents = urlString.components(separatedBy: "?");
        guard urlComponents.count == 2,
              let url = urlComponents.first,
              let paramString = urlComponents.last else {
            fatalError("解析url失败, 请检查url格式是否正确")
        }
        let paramsDict = parseParams(with: paramString);
        return RouterQueries(scheme: scheme, url: url, params: paramsDict);
    }

    func parseParams(with params: String) -> [String: Any] {
        var resultDict = [String: Any]();
        let paramsArray = params.components(separatedBy: "&");
        if paramsArray.count == 0 {
            fatalError("参数部分不合法, 请检查url的参数部分");
        }
        for paramItem in paramsArray {
            let item = paramItem.components(separatedBy: "=");
            guard item.count == 2,
                  let key = item.first,
                  let value = item.last else {
                fatalError("具体参数不合法, 请检查具体参数");
            }
            resultDict[key] = value;
        }
        return resultDict;
    }
}
