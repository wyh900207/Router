//
//  ViewController.m
//  HLRouter
//
//  Created by HomerLynn on 2017/11/21.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import "ViewController.h"
#import "HLRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *url = @"https://SecondViewController?paramOne=hello&person={\"name\":\"xiaoming\",\"age\":\"18\"}";
    [[HLRouter share] pushWith:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
