//
//  UIViewController+TTNavigation.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "UIViewController+TTNavigation.h"

@implementation UIViewController (TTNavigation)
- (void)tt_pushViewController:(UIViewController *)viewController {
    [self tt_pushViewController:viewController animated:YES];
}
- (void)tt_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 防止多次跳转
    if (viewController == self) return;
    
    if ([self isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)self pushViewController:viewController animated:YES];
        return;
    }
    
    NSAssert(self.navigationController, @"navigationController is nil");
    [self.navigationController pushViewController:viewController animated:animated];
}

- (UIViewController *)tt_pop {
    return [self tt_popViewControllerAnimated:YES];
}
- (UIViewController *)tt_popViewControllerAnimated:(BOOL)animated {
    NSAssert(self.navigationController, @"navigationController is nil");
    return [self.navigationController popViewControllerAnimated:animated];
}

- (void)tt_presentViewController:(UIViewController *)viewControllerToPresent {
    [self tt_presentViewController:viewControllerToPresent animated:YES];
}
- (void)tt_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated {
    if (self == viewControllerToPresent) return;
    [self presentViewController:viewControllerToPresent animated:animated completion:nil];
}

- (void)tt_dismiss {
    [self tt_dismissViewControllerAnimated:YES];
}
- (void)tt_dismissViewControllerAnimated:(BOOL)animated {
    [self dismissViewControllerAnimated:animated completion:nil];
}

@end
