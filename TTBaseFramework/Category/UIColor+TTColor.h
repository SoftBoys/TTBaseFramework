//
//  UIColor+TTColor.h
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TTColor)
+ (UIColor *)tt_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)tt_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)tt_colorWithHexString:(NSString *)hexString;
@end

@interface UIColor (TTNavigation)
+ (UIColor *)tt_navBackWhiteColor;
+ (UIColor *)tt_navLineColor;
+ (UIColor *)tt_navTitleColor;
+ (UIColor *)tt_tableBackColor;

@end
