//
//  HLRouter.h
//  HLRouter
//
//  Created by HomerLynn on 2017/11/21.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RouterParseResult.h"
#import "HLRouterProtocol.h"
#import "NSString+ParseURL.h"

@interface HLRouter : NSObject

+ (instancetype)share;

- (void)pushWith:(NSString *)url;

@end
