//
//  HLRouter.m
//  HLRouter
//
//  Created by HomerLynn on 2017/11/21.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import "HLRouter.h"

@implementation HLRouter

+ (instancetype)share {
    static HLRouter *router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[HLRouter alloc] init];
    });
    
    return router;
}

- (void)pushWith:(NSString *)url {
    RouterParseResult *result = url.parse;
    UIViewController *destination = (UIViewController *)[[NSClassFromString(result.url) alloc] init];
    if ([destination respondsToSelector:@selector(setup:)]) {
        [destination performSelector:@selector(setup:) withObject:result];
    }
    [[self getTopViewControllerWith:nil].navigationController pushViewController:destination animated:YES];
}

- (UIViewController *)getTopViewControllerWith:(UIViewController *)currentController {
    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    UIViewController *topVC = currentController ? currentController : rootVC;

    if ([topVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabController = (UITabBarController *)topVC;
        return [self getTopViewControllerWith:tabController.selectedViewController];
    }
    if ([topVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)topVC;
        return [self getTopViewControllerWith:navController.topViewController];
    }
    UIViewController *controller = topVC.presentedViewController ? topVC.presentedViewController : topVC;
    return controller;
}

@end
