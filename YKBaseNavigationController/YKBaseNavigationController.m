//
//  YKBaseNavigationController.m
//  Demo
//
//  Created by YK on 16/6/4.
//  Copyright © 2016年 LovePlus. All rights reserved.
//

#import "YKBaseNavigationController.h"
#import <objc/runtime.h>

@interface YKBaseNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation YKBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    id<UIGestureRecognizerDelegate>target=self.interactivePopGestureRecognizer.delegate;
    SEL sel =  NSSelectorFromString(@"handleNavigationTransition:");
    
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:target action:sel];
    edgePanGestureRecognizer.edges = UIRectEdgeLeft;
    edgePanGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:edgePanGestureRecognizer];
    
    
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:target action:sel];
    _panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:_panGestureRecognizer];
    self.interactivePopGestureRecognizer.enabled = NO;
}




- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count > 1) {
        if(gestureRecognizer == _panGestureRecognizer){
            UIViewController *vc = [self.viewControllers lastObject];
            return [vc fullGestureEnable];
        }else {
            return YES;
        }
    }else {
        return NO;
    }
}


- (void)dealloc {
    NSLog(@"dealloc");
}

@end



@implementation UIViewController (PopGesture)

- (void)setFullGestureEnable:(BOOL)fullGestureEnable {
    objc_setAssociatedObject(self, @selector(fullGestureEnable), @(fullGestureEnable), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)fullGestureEnable {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
