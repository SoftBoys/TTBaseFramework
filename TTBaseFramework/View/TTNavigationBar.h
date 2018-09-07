//
//  TTNavigationBar.h
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTNavigationBar;
@protocol TTNavigationBarDataSource <NSObject>
@optional
- (UIView *)navigationBarTitleView:(TTNavigationBar *)navigationBar;
- (UIView *)navigationBarLeftView:(TTNavigationBar *)navigationBar;
- (UIView *)navigationBarRightView:(TTNavigationBar *)navigationBar;

- (BOOL)navigationBarNeedLine:(TTNavigationBar *)navigationBar;
- (UIColor *)navigationBarLineColor:(TTNavigationBar *)navigationBar;
- (NSAttributedString *)navigationBarTitle:(TTNavigationBar *)navigationBar;
- (UIImage *)navigationBarLeftImage:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar;
- (UIImage *)navigationBarRightImage:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar;
@end

@protocol TTNavigationBarDelegate <NSObject>
- (void)didClickLeftButton:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar;
- (void)didClickRightButton:(UIButton *)button navigationBar:(TTNavigationBar *)navigationBar;
@end

@interface TTNavigationBar : UIView
+ (instancetype)navigationBar;
@property (nonatomic, weak) id<TTNavigationBarDataSource> dataSource;
@property (nonatomic, weak) id<TTNavigationBarDelegate> delegate;

/** 更新Bar */
- (void)updateNavigationBar;
@end
