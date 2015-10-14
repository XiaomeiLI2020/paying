//
//  Created by Zhouwu on 14-7-4.
//  Copyright (c) 2014年 Zhouwu. All rights reserved.
//

#import "ZWPayingMenu.h"
#import "ZWPayView.h"
#import "UIView+Extension.h"

@interface ZWPayingMenu()
@property (nonatomic, strong) UIView *contentView;
/**
 *  最底部的遮盖 ：屏蔽除菜单以外控件的事件
 */
@property (nonatomic, weak) UIButton *cover;
@property (nonatomic,weak)  ZWPayView *payView;
@end

@implementation ZWPayingMenu
#pragma mark - 初始化方法
- (id)initWithFrame:(CGRect)frame
{
    self                                      = [super initWithFrame:frame];
    if (self) {
        [self setupCover];
        ZWPayView *payView=[ZWPayView loadMyView];
        payView.center=self.center;
        self.payView=payView;
        [self addSubview:payView];
    }
    return self;
}

/** 蒙板 */
- (void)setupCover
{
    UIButton *cover = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cover];
    self.cover = cover;
    [self.cover setBackgroundColor:[UIColor blackColor]];
    self.cover.alpha = 0.25;
    [self.cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.cover.frame                          = self.bounds;
}

#pragma mark - 内部方法
- (void)coverClick
{
    [self dismiss];
}

#pragma mark - 公共方法

- (void)show
{
    // 添加菜单整体到窗口身上
    UIWindow *window                          = [[UIApplication sharedApplication].windows lastObject];
    self.frame                                = window.bounds;
    [window addSubview:self];
}

- (void)dismiss
{
    [self.payView.timer invalidate];
    [self removeFromSuperview];
}

@end
