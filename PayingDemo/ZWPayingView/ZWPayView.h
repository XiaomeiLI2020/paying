//
//  PayView.h
//  PayingDemo
//
//  Created by 德益富 on 15/10/14.
//  Copyright © 2015年 Dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWPayView : UIView

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger currentPageIndex;
@property(nonatomic,strong)  NSTimer *timer;
+(instancetype)loadMyView;
@end
