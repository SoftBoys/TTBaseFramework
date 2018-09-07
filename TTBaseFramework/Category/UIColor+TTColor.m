//
//  UIColor+TTColor.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "UIColor+TTColor.h"

@implementation UIColor (TTColor)
+ (UIColor *)tt_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [self tt_red:red green:green blue:blue alpha:1.0];
}
+ (UIColor *)tt_red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [self colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:alpha];
}
+ (UIColor *)tt_colorWithHexString:(NSString *)hexString {
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [colorString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor tt_red:r green:g blue:b];
}
@end

@implementation UIColor (TTNavigation)

+ (UIColor *)tt_navBackWhiteColor {
    return [self tt_red:246 green:246 blue:246];
}
+ (UIColor *)tt_navLineColor {
    return [self tt_red:226 green:226 blue:226];
}
+ (UIColor *)tt_navTitleColor {
    return [self tt_red:0 green:0 blue:0];
}
+ (UIColor *)tt_tableBackColor {
    return [self tt_red:236 green:236 blue:236];
}

@end
