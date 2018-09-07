//
//  TTBaseViewController.h
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTNavigationBar.h"
#import "UIViewController+TTNavigation.h"

@interface TTBaseViewController : UIViewController <TTNavigationBarDataSource>
@property (nonatomic, assign) UIStatusBarStyle barStyle;
@property (nonatomic, strong) TTNavigationBar *navigationBar;

/** 设置子控件Frame */
- (void)layoutSubviewsFrame;

@end
