//
//  PayView.m
//  PayingDemo
//
//  Created by 德益富 on 15/10/14.
//  Copyright © 2015年 Dyf. All rights reserved.
//

#import "ZWPayView.h"

@implementation ZWPayView


+(instancetype)loadMyView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZWPayView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    self.currentPageIndex=0;
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius=10.0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.35 target:self selector:@selector(changePageCurrentIndex) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer fire];
}

-(void)changePageCurrentIndex
{
    if(self.currentPageIndex>=3)
    {
        self.currentPageIndex=0;
         self.pageControl.currentPage = 0;
    }
    else
    {
        self.currentPageIndex++;
        self.pageControl.currentPage=self.currentPageIndex;
    }
   
}

@end
