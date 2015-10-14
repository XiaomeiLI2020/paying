//
//  ViewController.m
//  PayingDemo
//
//  Created by 德益富 on 15/10/14.
//  Copyright © 2015年 Dyf. All rights reserved.
//

#import "ViewController.h"
#import "ZWPayingMenu.h"

@interface ViewController ()
@property (nonatomic,weak)  ZWPayingMenu *payingMenu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)show:(id)sender {
    ZWPayingMenu *payingMenu=[[ZWPayingMenu alloc] initWithFrame:self.view.bounds];
    self.payingMenu=payingMenu;
    [payingMenu show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismisPayingMenu];
    });
}
// 消失
-(void)dismisPayingMenu
{
    [self.payingMenu dismiss];
}

@end
