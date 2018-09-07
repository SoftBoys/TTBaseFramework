//
//  TTBaseViewController.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "TTBaseViewController.h"
#import "TTConst.h"
#import "UIColor+TTColor.h"
#import "UIFont+TTFont.h"

@interface TTBaseViewController () <TTNavigationBarDataSource, TTNavigationBarDelegate>

@end

@implementation TTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.navigationBar.backgroundColor = [UIColor tt_navBackWhiteColor];
    
    self.barStyle = UIStatusBarStyleDefault;
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (kTTIS_IOS11) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
    
    // autolayout布局
//    [self layoutNavigationBar];
}
- (void)layoutNavigationBar {
    
    self.navigationBar.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.navigationBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.navigationBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.navigationBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.navigationBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:kTTTopBarHeight];
    [self.view addConstraint:topConstraint];
    [self.view addConstraint:leftConstraint];
    [self.view addConstraint:rightConstraint];
    [self.view addConstraint:heightConstraint];
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.view bringSubviewToFront:self.navigationBar];
    self.navigationBar.dataSource = self;
    self.navigationBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), kTTTopBarHeight);
    [self layoutSubviewsFrame];
}
- (void)layoutSubviewsFrame {}
#pragma mark -
- (void)setBarStyle:(UIStatusBarStyle)barStyle {
    _barStyle = barStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return _barStyle;
}
- (BOOL)shouldAutorotate {
    return YES;
}
#pragma mark -
- (UIColor *)navigationBarLineColor:(TTNavigationBar *)navigationBar {
    return [UIColor tt_navLineColor];
}
- (BOOL)navigationBarNeedLine:(TTNavigationBar *)navigationBar {
    return YES;
}
- (UIImage *)navigationBarLeftImage:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar {
    button.backgroundColor = [UIColor redColor];
    return nil;
}
- (UIImage *)navigationBarRightImage:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar {
    button.backgroundColor = [UIColor redColor];
    return nil;
}
- (NSAttributedString *)navigationBarTitle:(TTNavigationBar *)navigationBar {
    NSString *title = self.navigationItem.title ?: self.title;
    if (title) {
        return [self attributeWithTitle:title];
    }
    return nil;
}
- (NSAttributedString *)attributeWithTitle:(NSString *)title {
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:17],
                                 NSForegroundColorAttributeName : [UIColor tt_navTitleColor]
                                 };
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:title attributes:attributes];
    return string;
}

- (void)didClickLeftButton:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar {
    
    // 模态过来的
    if (self.presentedViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    // push 过来的
    if (self.navigationController) {
        [self tt_pop];
    }
    
}
- (void)didClickRightButton:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar {
    
}
#pragma mark -
- (TTNavigationBar *)navigationBar {
    if (!_navigationBar) {
        TTNavigationBar *navigationBar = [TTNavigationBar navigationBar];
//        navigationBar.dataSource = self;
        navigationBar.delegate = self;
        navigationBar.backgroundColor = [UIColor tt_navBackWhiteColor];
        [self.view addSubview:navigationBar];
        _navigationBar = navigationBar;
    }
    return _navigationBar;
}


@end
