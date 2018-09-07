//
//  TTNavigationBar.m
//  TTBaseFrameworkDemo
//
//  Created by gjw on 2018/9/6.
//  Copyright © 2018年 toutiao. All rights reserved.
//

#import "TTNavigationBar.h"
#import "TTConst.h"

@interface TTNavigationBar ()
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) CALayer *lineLayer;

@property (nonatomic, strong) UILabel *defaultTitleView;
@property (nonatomic, strong) UIButton *defaultLeftView;
@property (nonatomic, strong) UIButton *defaultRightView;
@end

@implementation TTNavigationBar

+ (instancetype)navigationBar {
    return [[TTNavigationBar alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat top = kTTStatusHeight;
    
    CGFloat leftW = CGRectGetWidth(self.leftView.frame) ?: kTTNavBarHeight;
    CGFloat leftH = CGRectGetHeight(self.leftView.frame) ?: kTTNavBarHeight;
    CGFloat leftY = (CGRectGetHeight(self.frame)+top-leftH)/2;
    self.leftView.frame = CGRectMake(0, leftY, leftW, leftH);
    
    CGFloat rightW = CGRectGetWidth(self.rightView.frame) ?: kTTNavBarHeight;
    CGFloat rightH = CGRectGetHeight(self.rightView.frame) ?: kTTNavBarHeight;
    CGFloat rightX = CGRectGetWidth(self.frame) - rightW;
    CGFloat rightY = (CGRectGetHeight(self.frame)+top-rightH)/2;
    self.rightView.frame = CGRectMake(rightX, rightY, rightW, rightH);
    
    CGFloat titleW = CGRectGetWidth(self.titleView.frame) ?: 120;
    CGFloat titleH = CGRectGetHeight(self.titleView.frame) ?: kTTNavBarHeight;
    CGFloat titleY = (CGRectGetHeight(self.frame)+top-titleH)/2;
    CGFloat titleX = (CGRectGetWidth(self.frame) - MAX(leftW, rightW))/2;
    self.titleView.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat lineY = CGRectGetHeight(self.frame);
    self.lineLayer.frame = CGRectMake(0, lineY, CGRectGetWidth(self.frame), kTTLineHeight);
}
- (void)updateNavigationBar {
    [self setupDataSourceUI];
}
#pragma mark -
- (void)setDataSource:(id<TTNavigationBarDataSource>)dataSource {
    _dataSource = dataSource;
    [self setupDataSourceUI];
}
- (void)setupDataSourceUI {
    
    if ([_dataSource respondsToSelector:@selector(navigationBarTitleView:)]) {
        self.titleView = [_dataSource navigationBarTitleView:self];
    } else {
        UILabel *labtitle = self.defaultTitleView;
        labtitle.attributedText = [_dataSource navigationBarTitle:self];
        [labtitle sizeToFit];
        self.titleView = labtitle;
    }
    
    if ([_dataSource respondsToSelector:@selector(navigationBarLeftView:)]) {
        self.leftView = [_dataSource navigationBarLeftView:self];
    } else {
        UIButton *button = self.defaultLeftView;
        UIImage *image = [_dataSource navigationBarLeftImage:button navigationBar:self];
        [button setImage:image forState:UIControlStateNormal];
        self.leftView = button;
    }
    
    if ([_dataSource respondsToSelector:@selector(navigationBarRightView:)]) {
        self.rightView = [_dataSource navigationBarRightView:self];
    } else {
        UIButton *button = self.defaultRightView;
        UIImage *image = [_dataSource navigationBarRightImage:button navigationBar:self];
        [button setImage:image forState:UIControlStateNormal];
        self.rightView = button;
    }
    
    if ([_dataSource respondsToSelector:@selector(navigationBarNeedLine:)]) {
        self.lineLayer.hidden = ![_dataSource navigationBarNeedLine:self];
    } else {
        self.lineLayer.hidden = NO;
    }
    
    if ([_dataSource respondsToSelector:@selector(navigationBarLineColor:)]) {
        self.lineLayer.backgroundColor = [_dataSource navigationBarLineColor:self].CGColor;
    }
    
    
    
//    [self layoutIfNeeded];
    [self setNeedsLayout];
}
- (void)btnClick:(UIButton *)button {
    if (button == self.defaultLeftView) {
        [_delegate didClickLeftButton:button navigationBar:self];
    } else if (button == self.defaultRightView) {
        [_delegate didClickRightButton:button navigationBar:self];
    }
}
- (void)setTitleView:(UIView *)titleView {
    if (_titleView != titleView) {
        [_titleView removeFromSuperview];
        
        _titleView = titleView;
        [self addSubview:titleView];
    }
}
- (void)setLeftView:(UIView *)leftView {
    if (_leftView != leftView) {
        [_leftView removeFromSuperview];
        
        _leftView = leftView;
        [self addSubview:leftView];
    }
}
- (void)setRightView:(UIView *)rightView {
    if (_rightView != rightView) {
        [_rightView removeFromSuperview];
        
        _rightView = rightView;
        [self addSubview:rightView];
    }
}

- (CALayer *)lineLayer {
    if (!_lineLayer) {
        _lineLayer = [CALayer layer];
        [self.layer addSublayer:_lineLayer];
    }
    return _lineLayer;
}
- (UILabel *)defaultTitleView {
    if (!_defaultTitleView) {
        _defaultTitleView = [UILabel new];
    }
    return _defaultTitleView;
}
- (UIButton *)defaultLeftView {
    if (!_defaultLeftView) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _defaultLeftView = button;
    }
    return _defaultLeftView;
}
- (UIButton *)defaultRightView {
    if (!_defaultRightView) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _defaultRightView = button;
    }
    return _defaultRightView;
}

@end
