//
// Created by HomerLynn on 2017/11/21.
// Copyright (c) 2017 HomerLynn. All rights reserved.
//

#import "NSString+ParseURL.h"
#import "RouterParseResult.h"

@implementation NSString (ParseURL)

- (RouterParseResult *)parse {
    RouterParseResult *result = [RouterParseResult new];
    // 分割字符串, 获取scheme
    if (![self containsString:@"://"]) {
        return result;
    }
    NSArray *schemeArray = [self componentsSeparatedByString:@"://"];
    if (schemeArray.count != 2) {
        return result;
    }
    result.scheme = schemeArray.firstObject;
    // 分割url部分, 获取url和参数
    if (![schemeArray.lastObject containsString:@"?"]) {
        result.url = schemeArray.lastObject;
        return result;
    }
    NSArray *urlArray = [schemeArray.lastObject componentsSeparatedByString:@"?"];
    if (urlArray.count != 2) {
        return result;
    }
    result.url = urlArray.firstObject;
    // 解析参数
    NSMutableDictionary *paramsDict = [NSMutableDictionary new];
    NSArray *paramArray = [urlArray.lastObject componentsSeparatedByString:@"&"];
    for (NSString *paramItem in paramArray) {
        NSArray *params = [paramItem componentsSeparatedByString:@"="];
        if (params.count != 2) break;
        paramsDict[params.firstObject] = params.lastObject;
    }
    result.params = paramsDict;

    return result;
}

- (NSDictionary *)parseToDictionary {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if (error) {
        NSLog(@"对象参数解析失败 : %@", error);
        return nil;
    }
    return dict;
}

@end
