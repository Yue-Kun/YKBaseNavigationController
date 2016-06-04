//
//  ViewController.m
//  Demo
//
//  Created by YK on 16/6/4.
//  Copyright © 2016年 LovePlus. All rights reserved.
//

#import "ViewController.h"
#import "YKBaseNavigationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置支持全屏滑动返回，支持Stroyboard设置
    //self.fullGestureEnable = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
