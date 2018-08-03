//
//  WXJSlidingNavigationView.h
//  TopPageDemo
//
//  Created by MrWXJ on 2018/8/3.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//
//-------------
//滑动导航view带VC
//-------------

#import <UIKit/UIKit.h>
#import "CustomScrollView.h"

typedef void(^DidSelectIndex)(NSInteger index);

@interface WXJSlidingNavigationView : UIView

//绑定菜单栏
@property (nonatomic,strong) NSMutableArray *menuArray;
//所有内容view
@property (nonatomic,strong) NSMutableArray *allViewArray;

- (instancetype)initWithFrame:(CGRect)frame
                    menuArray:(NSArray *)menuArray
               didSelectIndex:(DidSelectIndex)didSelectIndex;

@end
