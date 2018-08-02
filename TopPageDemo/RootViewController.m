//
//  RootViewController.m
//  TopPageDemo
//
//  Created by MrWXJ on 2018/8/2.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

#import "RootViewController.h"

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    // Do any additional setup after loading the view.
    
    NSArray *arr = @[@"关注",@"推荐",@"贵阳",@"精选",@"小说",@"科学",@"直播",@"电影"];
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,100, WIDTH, 40)];
    scroll.contentSize = CGSizeMake(100*arr.count, 40);
    scroll.bounces = NO;
    scroll.scrollEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.backgroundColor = [UIColor redColor];
    [scroll flashScrollIndicators];
    [self.view addSubview:scroll];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(300, 0, 100, 40)];
    view.backgroundColor = [UIColor whiteColor];
    [scroll addSubview:view];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
