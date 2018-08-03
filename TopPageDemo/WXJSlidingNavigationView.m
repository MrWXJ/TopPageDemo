//
//  WXJSlidingNavigationView.m
//  TopPageDemo
//
//  Created by MrWXJ on 2018/8/3.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

#import "WXJSlidingNavigationView.h"

#define headerHeight 40
#define titleWidth 60

@interface WXJSlidingNavigationView ()<UIScrollViewDelegate>

@property (nonatomic, strong) CustomScrollView *contentScrollView;
@property (nonatomic, strong) UIScrollView *headerScrollview;
@property (nonatomic, assign) NSUInteger changeIndex;
@property (nonatomic, strong) NSMutableArray *buttonTotalArray;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) DidSelectIndex didSelectIndex;
@property (nonatomic, assign) CGFloat headerWidth;

@end

@implementation WXJSlidingNavigationView

/**
 总按钮

 @return buttonTotalArray
 */
- (NSMutableArray *)buttonTotalArray {
    if (!_buttonTotalArray) {
        _buttonTotalArray = [NSMutableArray array];
    }
    return _buttonTotalArray;
}

/**
 绑定菜单栏
 
 @return menuArray
 */
- (NSMutableArray *)menuArray {
    if (!_menuArray) {
        _menuArray = [NSMutableArray array];
    }
    return _menuArray;
}

/**
 所有内容view

 @return allViewArray
 */
- (NSMutableArray *)allViewArray {
    if (!_allViewArray) {
        _allViewArray = [NSMutableArray array];
        for (int i = 0; i < _menuArray.count; i++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(_headerWidth*i, 0, _headerWidth, self.frame.size.height-headerHeight)];
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            view.backgroundColor=[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
            [_allViewArray addObject:view];
        }
    }
    return _allViewArray;
}

- (instancetype)initWithFrame:(CGRect)frame
            menuArray:(NSArray *)menuArray
       didSelectIndex:(DidSelectIndex)didSelectIndex {
    self = [super initWithFrame:frame];
    if (self) {
        _changeIndex = 0;
        _headerWidth = frame.size.width;
        [self.menuArray addObjectsFromArray:menuArray];
        self.didSelectIndex = didSelectIndex;

        [self creatHeaderScrollView];
        [self creatContentScrollView];
    }
    return self;
}

/**
 创建头部滑动导航
 */
- (void)creatHeaderScrollView {
    _headerScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _headerWidth, headerHeight)];
    _headerScrollview.contentSize = CGSizeMake(titleWidth * _menuArray.count, 40);
    _headerScrollview.bounces = NO;
    _headerScrollview.scrollEnabled = YES;
    _headerScrollview.showsHorizontalScrollIndicator = NO;
    [_headerScrollview flashScrollIndicators];
    [self addSubview:_headerScrollview];
    
    for (int i = 0; i < _menuArray.count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(titleWidth*i, 0, titleWidth, headerHeight);
        [titleButton setTitle:_menuArray[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        titleButton.backgroundColor = [UIColor whiteColor];
        titleButton.tag = 100 + i;
        titleButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [titleButton addTarget:self action:@selector(titleSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        [_headerScrollview addSubview:titleButton];
        [self.buttonTotalArray addObject:titleButton];
    }
    self.selectIndex = 1;
}

/**
 创建内容容器
 */
- (void)creatContentScrollView {
    _contentScrollView = [[CustomScrollView alloc] init];
//    _headerScrollview.frame = CGRectMake(0, 100, _headerWidth, headerHeight);
    _contentScrollView.frame = CGRectMake(0, CGRectGetMaxY(_headerScrollview.frame), _headerWidth, self.frame.size.height-headerHeight);
    _contentScrollView.delegate = self;
    _contentScrollView.backgroundColor = [UIColor lightGrayColor];
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.scrollEnabled = YES;
    _contentScrollView.bounces = NO;
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.contentSize = CGSizeMake(_headerWidth*self.allViewArray.count, self.frame.size.height-headerHeight);
    [self addSubview:_contentScrollView];
    //将View分配到_contentScrollView上去
    for (int i = 0; i < _allViewArray.count; i++) {
        [_contentScrollView addSubview:_allViewArray[i]];
    }
}

/**
 设置默认的select
 
 @param selectIndex 1~
 */
- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectButton = _buttonTotalArray[selectIndex - 1];
    [_selectButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _selectButton.titleLabel.font = [UIFont systemFontOfSize:19];
}

/**
 点击select的相关操作
 
 @param button button
 */
- (void)titleSelectToIndex:(UIButton *)button {
    [self changeColorAndOffsetWithIndex:button.tag-100];
    [UIView animateWithDuration:0 animations:^{
        //animated为NO,防止点击头部出现闪动问题
        [_contentScrollView setContentOffset:CGPointMake(_headerWidth*(button.tag-100),_contentScrollView.contentOffset.y) animated:NO];
    }];
}

/**
 改变字体及Offset
 
 @param index index
 */
- (void)changeColorAndOffsetWithIndex:(NSInteger)index {
    //先还原颜色字体设置
    [_selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _selectButton.titleLabel.font = [UIFont systemFontOfSize:17];
    _selectButton = _buttonTotalArray[index];
    //再次改变颜色字体
    [_selectButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _selectButton.titleLabel.font = [UIFont systemFontOfSize:19];
    
    CGRect rect = [_selectButton.superview convertRect:_selectButton.frame toView:self];
    //设置相关偏移量
    [UIView animateWithDuration:0 animations:^{
        CGPoint contentOffset = _headerScrollview.contentOffset;
        if (contentOffset.x - (_headerWidth*0.5 - rect.origin.x - titleWidth*0.5) <= 0) {
            [_headerScrollview setContentOffset:CGPointMake(0, contentOffset.y) animated:YES];
        } else if (contentOffset.x - (_headerWidth*0.5 - rect.origin.x - titleWidth*0.5) + _headerWidth >= _menuArray.count*titleWidth) {
            [_headerScrollview setContentOffset:CGPointMake(_menuArray.count*titleWidth-_headerWidth, contentOffset.y) animated:YES];
        } else {
            [_headerScrollview setContentOffset:CGPointMake(contentOffset.x - (_headerWidth*0.5 - rect.origin.x - titleWidth*0.5), contentOffset.y) animated:YES];
        }
    }];
    
    //这里响应相关的操作
    if (_changeIndex != index) {
        _changeIndex = (int)index;
        if (self.didSelectIndex) {
            self.didSelectIndex(_changeIndex);
        }
    }
}

/**
 监听滚动事件判断当前拖动位置做出相应的改变
 
 @param scrollView scrollView
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double index = scrollView.contentOffset.x / _headerWidth;
    if (scrollView == _contentScrollView) {
        [self changeColorAndOffsetWithIndex:index];
    }
}



@end
