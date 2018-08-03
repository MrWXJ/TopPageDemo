//
//  WXJSlidingNavigationView.h
//  TopPageDemo
//
//  Created by MrWXJ on 2018/8/3.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//
//-------------
//滑动导航 带内容View
//-------------

#import <UIKit/UIKit.h>
#import "CustomScrollView.h"

typedef void(^DidSelectIndex)(NSInteger index);

@interface WXJSlidingNavigationView : UIView

//绑定菜单栏
@property (nonatomic,strong) NSMutableArray *menuArray;
//所有内容view(空View,可以往里加)
@property (nonatomic,strong) NSMutableArray *allViewArray;
//滑动导航ScrollView
@property (nonatomic, strong) UIScrollView *headerScrollview;
//内容ScrollView
@property (nonatomic, strong) CustomScrollView *contentScrollView;

/**
 初始化滑动导航

 @param frame frame description
 @param menuArray 菜单名字数组
 @param didSelectIndex 点击菜单的index
 @return WXJSlidingNavigationView
 */
- (instancetype)initWithFrame:(CGRect)frame
                    menuArray:(NSArray *)menuArray
               didSelectIndex:(DidSelectIndex)didSelectIndex;

/**
 点击select的相关操作
 
 @param button button
 */
- (void)titleSelectToIndex:(UIButton *)button;

@end
