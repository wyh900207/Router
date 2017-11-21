//
//  HLRouterProtocol.h
//  HLRouter
//
//  Created by HomerLynn on 2017/11/21.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RouterParseResult;

@protocol HLRouterProtocol <NSObject>

@required
- (void)setup:(RouterParseResult *)result;

@end
