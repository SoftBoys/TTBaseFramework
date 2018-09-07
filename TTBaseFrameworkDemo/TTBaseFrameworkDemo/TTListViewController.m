//
//  TTListViewController.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "TTListViewController.h"
#import "TTConst.h"
#import "UIColor+TTColor.h"

@interface TTListViewController () <UIScrollViewDelegate>

@end

@implementation TTListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"List VC";

    self.view.backgroundColor = [UIColor orangeColor];
    
    
}


- (NSInteger)tt_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (CGFloat)tt_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tt_configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [NSString stringWithFormat:@"name--%@", @(indexPath.row)];
}
#pragma mark -

#pragma mark -
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentInset.top + scrollView.contentOffset.y;
    
    CGFloat minOffsetY = kTTTopBarHeight;
    CGFloat maxOffsetY = minOffsetY + 200;
    
    CGFloat red_begin = 246.f;
    CGFloat green_begin = 246.f;
    CGFloat blue_begin = 246.f;
    
    CGFloat red_end = 46.f;
    CGFloat green_end = 164.f;
    CGFloat blue_end = 84.f;
    
    
    UIColor *color = nil;
    
    if (offsetY < minOffsetY) {
        color = [UIColor tt_red:red_begin green:green_begin blue:blue_begin];
        self.barStyle = UIStatusBarStyleDefault;
    } else if (offsetY < maxOffsetY) {
        CGFloat red = red_begin + (red_end-red_begin) * (offsetY-minOffsetY)/(maxOffsetY-minOffsetY);
        CGFloat green = green_begin + (green_end-green_begin) * (offsetY-minOffsetY)/(maxOffsetY-minOffsetY);
        CGFloat blue = blue_begin + (blue_end-blue_begin)* (offsetY-minOffsetY)/(maxOffsetY-minOffsetY);
        
        color = [UIColor tt_red:red green:green blue:blue];
        self.barStyle = UIStatusBarStyleDefault;
    } else {
        color = [UIColor tt_red:red_end green:green_end blue:blue_end];
        self.barStyle = UIStatusBarStyleLightContent;
    }
    
    self.navigationBar.backgroundColor = color;
    
    
//    [self.navigationBar updateNavigationBar];
}



@end
