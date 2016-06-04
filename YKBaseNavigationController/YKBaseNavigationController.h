//
//  YKBaseNavigationController.h
//  Demo
//
//  Created by YK on 16/6/4.
//  Copyright © 2016年 LovePlus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKBaseNavigationController : UINavigationController

@end


@interface UIViewController (PopGesture)

@property (assign, nonatomic) BOOL fullGestureEnable;

@end
