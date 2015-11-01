//
//  ZYPlayingViewController.m
//  音乐播放器
//
//  Created by 章芝源 on 15/11/1.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYPlayingViewController.h"
#import "UIView+AdjustFrame.h"
@interface ZYPlayingViewController ()

@end

@implementation ZYPlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.view.frame = window.bounds;
    
    [window addSubview:self.view];
    
    self.view.y = self.view.height;
    
    //动画
    [UIView animateWithDuration:1.0 animations:^{
        self.view.y = 0;
    }];
  
}

@end
