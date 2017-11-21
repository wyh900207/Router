//
//  SecondViewController.m
//  HLRouter
//
//  Created by HomerLynn on 2017/11/21.
//  Copyright © 2017年 HomerLynn. All rights reserved.
//

#import "SecondViewController.h"
#import "HLRouter.h"
#import "Person.h"

@interface SecondViewController ()<HLRouterProtocol>

@property (nonatomic, copy) NSString *paramOne;
@property (nonatomic, copy) NSString *paramTwo;
@property (nonatomic, strong) Person *person;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"name is : %@, age is : %ld", self.person.name, self.person.age);
}

- (void)setup:(RouterParseResult *)result {
    NSLog(@"scheme is : %@, url is : %@, params is : %@", result.scheme, result.url, result.params);
    self.paramOne = result.params[@"paramOne"];
    self.paramTwo = result.params[@"paramTwo"];
    NSDictionary *personDict = [result.params[@"person"] parseToDictionary];
    self.person.name = personDict[@"name"];
    self.person.age = [personDict[@"age"] integerValue];
}

- (Person *)person {
    if (!_person) {
        _person = [Person new];
    }
    return _person;
}

@end
