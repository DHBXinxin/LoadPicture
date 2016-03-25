//
//  ViewController.m
//  LoadPicture
//
//  Created by IOS on 16/3/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "WaterFlow.h"

@interface ViewController ()
{
    WaterFlow *water;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray* urls = @[
                      @"http://img0.bdstatic.com/img/image/shouye/leimu/mingxing.jpg",
                      @"http://img1.bdstatic.com/img/image/8662934349b033b5bb5c55e5d9834d3d539b700bcce.jpg",
                      @"http://img.baidu.com/img/image/3bf33a87e950352a5947ae485143fbf2b2.jpg",
                      @"http://imgstatic.baidu.com/img/image/7af40ad162d9f2d3cdc19be8abec8a136227cce1.jpg",
                      @"http://imgstatic.baidu.com/img/image/weimeiyijing0207.jpg",
                      @"http://e.hiphotos.baidu.com/image/w%3D400/sign=2e56c8010ed79123e0e095749d355917/ae51f3deb48f8c5470385d2638292df5e1fe7fd4.jpg",
                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=e37cc47c6509c93d07f20ff7af3cf8bb/7a899e510fb30f2468cc6271ca95d143ad4b0369.jpg",
                      @"http://b.hiphotos.baidu.com/image/w%3D400/sign=ac0b8e2b92ef76c6d0d2fa2bad17fdf6/a71ea8d3fd1f4134dedc5974271f95cad0c85ed4.jpg",
                      @"http://imgstatic.baidu.com/img/image/huacaozhiwu0207.jpg",
                      @"http://d.hiphotos.baidu.com/image/w%3D400/sign=7d27c75af4246b607b0eb374dbf81a35/5882b2b7d0a20cf4f28367d674094b36acaf99ac.jpg",
                      ];
    water = [[WaterFlow alloc]initWithFrame:self.view.bounds];
    water.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:water];
    
    water.pictures = urls;
    
    
    UIButton *add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    add.frame = CGRectMake(10, 10, 60, 40);
    [add setTitle:@"添加" forState:UIControlStateNormal];
    [add addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:add];
    
    UIButton *fresh = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fresh.frame = CGRectMake(10, 100, 60, 40);
    [fresh setTitle:@"刷新" forState:UIControlStateNormal];
    [fresh addTarget:self action:@selector(freshClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fresh];
}
- (void)freshClick:(UIButton *)sender {
    NSArray* urls = @[
                      @"http://img0.bdstatic.com/img/image/shouye/leimu/mingxing.jpg",
                      @"http://img1.bdstatic.com/img/image/8662934349b033b5bb5c55e5d9834d3d539b700bcce.jpg",
                      @"http://img.baidu.com/img/image/3bf33a87e950352a5947ae485143fbf2b2.jpg",
                      @"http://imgstatic.baidu.com/img/image/7af40ad162d9f2d3cdc19be8abec8a136227cce1.jpg",
                      @"http://imgstatic.baidu.com/img/image/weimeiyijing0207.jpg",
                      @"http://e.hiphotos.baidu.com/image/w%3D400/sign=2e56c8010ed79123e0e095749d355917/ae51f3deb48f8c5470385d2638292df5e1fe7fd4.jpg",
                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=e37cc47c6509c93d07f20ff7af3cf8bb/7a899e510fb30f2468cc6271ca95d143ad4b0369.jpg",
                      @"http://b.hiphotos.baidu.com/image/w%3D400/sign=ac0b8e2b92ef76c6d0d2fa2bad17fdf6/a71ea8d3fd1f4134dedc5974271f95cad0c85ed4.jpg",
                      @"http://imgstatic.baidu.com/img/image/huacaozhiwu0207.jpg",
                      @"http://d.hiphotos.baidu.com/image/w%3D400/sign=7d27c75af4246b607b0eb374dbf81a35/5882b2b7d0a20cf4f28367d674094b36acaf99ac.jpg",
                      ];
    [water refreshWithData:urls];
}
- (void)addClick:(UIButton *)sender {
    NSArray* urls = @[
                      @"http://img0.bdstatic.com/img/image/shouye/leimu/mingxing.jpg",
                      @"http://img1.bdstatic.com/img/image/8662934349b033b5bb5c55e5d9834d3d539b700bcce.jpg",
                      @"http://img.baidu.com/img/image/3bf33a87e950352a5947ae485143fbf2b2.jpg",
                      @"http://imgstatic.baidu.com/img/image/7af40ad162d9f2d3cdc19be8abec8a136227cce1.jpg",
                      @"http://imgstatic.baidu.com/img/image/weimeiyijing0207.jpg",
                      @"http://e.hiphotos.baidu.com/image/w%3D400/sign=2e56c8010ed79123e0e095749d355917/ae51f3deb48f8c5470385d2638292df5e1fe7fd4.jpg",
                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=e37cc47c6509c93d07f20ff7af3cf8bb/7a899e510fb30f2468cc6271ca95d143ad4b0369.jpg",
                      @"http://b.hiphotos.baidu.com/image/w%3D400/sign=ac0b8e2b92ef76c6d0d2fa2bad17fdf6/a71ea8d3fd1f4134dedc5974271f95cad0c85ed4.jpg",
                      @"http://imgstatic.baidu.com/img/image/huacaozhiwu0207.jpg",
                      @"http://d.hiphotos.baidu.com/image/w%3D400/sign=7d27c75af4246b607b0eb374dbf81a35/5882b2b7d0a20cf4f28367d674094b36acaf99ac.jpg",
                      ];
    [water addMore:urls];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
