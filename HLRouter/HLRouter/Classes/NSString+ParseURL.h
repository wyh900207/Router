//
// Created by HomerLynn on 2017/11/21.
// Copyright (c) 2017 HomerLynn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RouterParseResult;

@interface NSString (ParseURL)

- (RouterParseResult *)parse;
- (NSDictionary *)parseToDictionary;

@end
