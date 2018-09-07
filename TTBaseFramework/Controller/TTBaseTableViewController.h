//
//  TTBaseTableViewController.h
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "TTBaseViewController.h"

@protocol TTTableViewDataSource <NSObject>

- (UITableViewCell *)tt_tableView:(UITableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tt_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (NSInteger)tt_numberOfSectionsInTableView:(UITableView *)tableView;

- (CGFloat)tt_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tt_tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tt_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

/** 设置数据源 */
- (void)tt_configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)tt_sepLineEdgeInsetsAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol TTTableViewDelegate <NSObject>
- (void)tt_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface TTBaseTableViewController : TTBaseViewController <TTTableViewDataSource, TTTableViewDelegate>
@property (nonatomic, strong, readonly) UITableView *tableView;
- (instancetype)initWithStyle:(UITableViewStyle)style;
@end
