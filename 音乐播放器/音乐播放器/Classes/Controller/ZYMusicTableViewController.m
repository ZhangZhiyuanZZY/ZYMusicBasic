//
//  ZYMusicTableViewController.m
//  音乐播放器
//
//  Created by 章芝源 on 15/10/31.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYMusicTableViewController.h"
#import "ZYMusic.h"
#import "MJExtension.h"
#import "UIImage+Circle.h"
#import "ZYPlayingViewController.h"
@interface ZYMusicTableViewController ()

///所有音乐的数组
@property(nonatomic, strong)NSArray *musics;
///播放控制器
@property(strong, nonatomic)ZYPlayingViewController *playingVC;//这里只是显示有这个类而已,想在下面使用的话需要自己实例化, 可以懒加载
@end

@implementation ZYMusicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //改变cell的高度
    self.tableView.rowHeight = 80;
   
}

#pragma mark - 懒加载
- (NSArray *)musics
{
    if (_musics == nil) {
        //MJExtension  把一个plist文件转化成模型数组
        self.musics = [ZYMusic objectArrayWithFilename:@"Musics.plist"];
    }
    return _musics;
}

- (ZYPlayingViewController *)playingVC
{
    if (_playingVC == nil) {
        _playingVC = [[ZYPlayingViewController alloc]init];
    }
    return _playingVC;
}

#pragma mark - Table view data source
///选中cell的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. 让cell变成不可选中的
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //2. 选中弹出控制器
    [self.playingVC show];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

       return self.musics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MusicCell"];
    //取出模型对象
    ZYMusic *music = self.musics[indexPath.row];
    
    cell.imageView.image = [UIImage circleImageWithName:music.singerIcon borderWidth:3.0 borderColor:[UIColor purpleColor]];
//    cell.imageView.image = [UIImage imageNamed:music.singerIcon];
    cell.textLabel.text = music.name;
    cell.detailTextLabel.text = music.singer;
    
    return cell;
}

@end
