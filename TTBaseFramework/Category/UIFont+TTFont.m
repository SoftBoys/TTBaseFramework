//
//  UIFont+TTFont.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "UIFont+TTFont.h"

@implementation UIFont (TTFont)
+ (UIFont *)tt_font14 {
    return [UIFont tt_systemFontOfSize:14.7];
}
+ (UIFont *)tt_font15 {
    return [UIFont tt_systemFontOfSize:15.4];
}
+ (UIFont *)tt_font16 {
    return [UIFont tt_systemFontOfSize:16.7];
}
+ (UIFont *)tt_font17 {
    return [UIFont tt_systemFontOfSize:17.4];
}
+ (UIFont *)tt_systemFontOfSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)tt_boldSystemFontOfSize:(CGFloat)fontSize {
    return [UIFont boldSystemFontOfSize:fontSize];
}
@end
