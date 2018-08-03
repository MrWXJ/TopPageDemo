//
//  RootViewController.m
//  TopPageDemo
//
//  Created by MrWXJ on 2018/8/2.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

#import "RootViewController.h"
#import "WXJSlidingNavigationView.h"

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@"关注",@"推荐",@"贵阳",@"精选",@"小说",@"科学",@"直播",@"电影"];
    WXJSlidingNavigationView *slid = [[WXJSlidingNavigationView alloc] initWithFrame:CGRectMake(0, 60, WIDTH, HEIGHT - 60) menuArray:arr didSelectIndex:^(NSInteger index) {
        NSLog(@"index-----%ld",index);
    }];
    [self.view addSubview:slid];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    UIView *v1 = slid.allViewArray[1];
    [v1 addSubview:view];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
