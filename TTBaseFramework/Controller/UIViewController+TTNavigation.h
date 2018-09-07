//
//  UIViewController+TTNavigation.h
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TTNavigation)

- (void)tt_pushViewController:(UIViewController *)viewController;
- (void)tt_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (UIViewController *)tt_pop;
- (UIViewController *)tt_popViewControllerAnimated:(BOOL)animated;

- (void)tt_presentViewController:(UIViewController *)viewControllerToPresent;
- (void)tt_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated;

- (void)tt_dismiss;
- (void)tt_dismissViewControllerAnimated:(BOOL)animated;
@end
