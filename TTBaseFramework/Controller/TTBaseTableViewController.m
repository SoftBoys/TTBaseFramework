//
//  TTBaseTableViewController.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "TTBaseTableViewController.h"
#import "TTConst.h"
#import "UIColor+TTColor.h"

@interface TTBaseTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TTBaseTableViewController
- (instancetype)init {
    return [self initWithStyle:UITableViewStylePlain];
}
- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super init]) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _tableView.backgroundColor = [UIColor tt_tableBackColor];
        
        // 关闭预估行高 (解决cell伸缩抖动的bug)
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        
//        _tableView.rowHeight = 0;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
- (void)layoutSubviewsFrame {
    CGFloat tableY = CGRectGetMaxY(self.navigationBar.frame);
    CGFloat tableW = CGRectGetWidth(self.navigationBar.frame);
    CGFloat tableH = CGRectGetHeight(self.view.bounds) - tableY;
    self.tableView.frame = CGRectMake(0, tableY, tableW, tableH);
}
#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tt_tableView:tableView cellForIndexPath:indexPath];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self tt_tableView:tableView numberOfRowsInSection:section];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self tt_numberOfSectionsInTableView:tableView];
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tt_tableView:tableView heightForRowAtIndexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self tt_tableView:tableView heightForHeaderInSection:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self tt_tableView:tableView heightForFooterInSection:section];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 设置数据源
    [self tt_configCell:cell indexPath:indexPath];
    
    // 设置线条
    UIEdgeInsets insets = [self tt_sepLineEdgeInsetsAtIndexPath:indexPath];
    tableView.separatorInset = insets;
    tableView.layoutMargins = insets;
    cell.separatorInset = insets;
    cell.layoutMargins = insets;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self tt_tableView:tableView didSelectRowAtIndexPath:indexPath];
}
#pragma mark - TTTableViewDataSource
- (UITableViewCell *)tt_tableView:(UITableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}
- (NSInteger)tt_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (NSInteger)tt_numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tt_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
- (CGFloat)tt_tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (CGFloat)tt_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

/** 设置数据源 */
- (void)tt_configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    
}
- (UIEdgeInsets)tt_sepLineEdgeInsetsAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark -
- (void)tt_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
@end
