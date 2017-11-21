//
// Created by HomerLynn on 2017/11/21.
// Copyright (c) 2017 HomerLynn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RouterParseResult : NSObject

@property(nonatomic, copy  ) NSString *scheme;
@property(nonatomic, copy  ) NSString *url;
@property(nonatomic, strong) NSDictionary *params;

@end