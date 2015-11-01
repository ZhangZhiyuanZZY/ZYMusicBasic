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
    
    //当点击歌曲后,  歌曲栏tableView变成不能点击状态
    window.userInteractionEnabled = NO;
    
    self.view.frame = window.bounds;
    
    [window addSubview:self.view];
    
    self.view.y = self.view.height;
    
    //动画
    [UIView animateWithDuration:1.0 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {// 播放歌曲的view 完全展示后 设置可以点击
        window.userInteractionEnabled = YES;
    }];
    
}

- (IBAction)exit:(id)sender {
    
    //让self.view.yu复位
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    window.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:1.0 animations:^{
        self.view.y = self.view.height;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
    }];
    
    
}


@end
