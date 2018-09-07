//
//  TTConst.h
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark -- 系统宽高
#define kTTScreenWidth      ([UIScreen mainScreen].bounds.size.width)
#define kTTScreenHeight     ([UIScreen mainScreen].bounds.size.height)
#define kTTStatusHeight     ([UIApplication sharedApplication].statusBarFrame.size.height)
#define kTTNavBarHeight     44.0f
#define kTTTopBarHeight     (kTTStatusHeight+kTTNavBarHeight)
#define kTTTabBarHeight     49.0f
//#define kTTToolBarHeight    44.0f
#define kTTTabBarSafeHeight (kTTIPhoneX ? 34.0f:0.f)
#define kTTLineHeight       (1.0/[UIScreen mainScreen].scale)

#pragma mark -- 系统 && 设备
#define kTTIS_IOS11         @available(iOS 11, *)
#define kTTIPhoneX          (kTTScreenWidth==375&&kTTScreenHeight==812)
#define kTTIPhone6P         (kTTScreenWidth==414&&kTTScreenHeight==736)
#define kTTIPhone6          (kTTScreenWidth==375&&kTTScreenHeight==667)
#define kTTIPhone5          (kTTScreenWidth==320&&kTTScreenHeight==568)
#define kTTIPhone4          (kTTScreenWidth==320&&kTTScreenHeight==480)



@interface TTConst : NSObject

@end
