//
//  TTNavigationController.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "TTNavigationController.h"

@interface TTNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation TTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.interactivePopGestureRecognizer.delegate = self;
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return self.topViewController.prefersStatusBarHidden;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 是够支持侧滑交互
    BOOL canInteractive = self.viewControllers.count > 1;
    return canInteractive;
}

#pragma mark -

@end
