//
//  ViewController.m
//  TopPageDemo
//
//  Created by MrWXJ on 2018/8/2.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


//UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STATUSHEIGHT+44, headerWidth, 40)];
//scroll.contentSize = CGSizeMake(titleWidth*_titltTotalArray.count, 40);
//scroll.bounces = NO;
//scroll.scrollEnabled = YES;
//scroll.showsHorizontalScrollIndicator = NO;
//[scroll flashScrollIndicators];
//[self.view addSubview:scroll];
//_scroll = scroll;
//
//for (int i = 0; i < _titltTotalArray.count; i++) {
//    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    titleButton.frame = CGRectMake(titleWidth*i, 0, titleWidth, titleHeight);
//    [titleButton setTitle:_titltTotalArray[i] forState:UIControlStateNormal];
//    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    titleButton.backgroundColor = DEFAULTCOLOR;
//    //        titleButton.backgroundColor = [UIColor whiteColor];
//    titleButton.tag = 100+i;
//    [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
//    titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [scroll addSubview:titleButton];
//
//    if (i != _titltTotalArray.count-1) {
//        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(titleWidth-1, 15, 1, 10)];
//        line.backgroundColor = RGBCOLOR(65, 216, 111, 1);
//        [titleButton addSubview:line];
//    }
//
//    if (i == 0) {
//        selectButton = titleButton;
//        [selectButton setTitleColor:RGBCOLOR(65, 216, 111, 1) forState:UIControlStateNormal];
//    }
//    [self.buttonTotalArray addObject:titleButton];
//}
//// 滑块
//UIView *sliderV=[[UIView alloc]initWithFrame:CGRectMake(15, titleHeight-2, titleWidth - 30, 2)];
//sliderV.backgroundColor = RGBCOLOR(65, 216, 111, 1);
//[scroll addSubview:sliderV];
//_sliderView = sliderV;


//- (void)scrollViewSelectToIndex:(UIButton *)button {
//    [self selectButton:button.tag-100];
//    [UIView animateWithDuration:0 animations:^{
//        _scrollView.contentOffset = CGPointMake(WIDTH*(button.tag-100), 0);
//    }];
//}
//
////选择某个标题
//- (void)selectButton:(NSInteger)index {
//    [selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    selectButton = _buttonTotalArray[index];
//    [selectButton setTitleColor:RGBCOLOR(65, 216, 111, 1) forState:UIControlStateNormal];
//
//    CGRect rect = [selectButton.superview convertRect:selectButton.frame toView:self.view];
//    [UIView animateWithDuration:0 animations:^{
//        CGPoint contentOffset = _scroll.contentOffset;
//        //        NSLog(@"::%f-%f",contentOffset.x,contentOffset.y);
//        if (contentOffset.x - (headerWidth/2-rect.origin.x-titleWidth/2)<=0) {
//            [_scroll setContentOffset:CGPointMake(0, contentOffset.y) animated:YES];
//        } else if (contentOffset.x - (headerWidth/2-rect.origin.x-titleWidth/2)+headerWidth>=_titltTotalArray.count*titleWidth) {
//            [_scroll setContentOffset:CGPointMake(_titltTotalArray.count*titleWidth-headerWidth, contentOffset.y) animated:YES];
//        } else {
//            [_scroll setContentOffset:CGPointMake(contentOffset.x - (headerWidth/2-rect.origin.x-titleWidth/2), contentOffset.y) animated:YES];
//        }
//    }];
//
//    if (_changeIndex != index) {
//        _changeIndex = (int)index;
//        _tableview = _tableviewTotalArray[_changeIndex];
//        _sliderView.frame = CGRectMake(titleWidth*index + 15, titleHeight-2, titleWidth - 30, 2);
//        //        [self requestListInfoWithPage:1];
//        [self getListDataWithPage:1 index:_changeIndex];
//    }
//}
//
////监听滚动事件判断当前拖动到哪一个了
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    double index = scrollView.contentOffset.x / WIDTH;
//    if (scrollView == _scrollView) {
//        [self selectButton:index];
//        //        _sliderView.x = titleWidth*_ind + 15;
//    } else {
//        //        NSLog(@"index==%f",index);
//    }
//    // 只有左右滑动时 才会改变标签
//    if (scrollView.contentOffset.x < lastContentOffset) {
//        _sliderView.frame = CGRectMake(titleWidth*index + 15, titleHeight-2, titleWidth - 30, 2);
//    } else if (scrollView.contentOffset.x > lastContentOffset){
//        _sliderView.frame = CGRectMake(titleWidth*index + 15, titleHeight-2, titleWidth - 30, 2);
//    }
//}
//
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    lastContentOffset = scrollView.contentOffset.x;
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    NSLog(@"结束拖拽");
//}


//CustomScrollView *scrollView = [[CustomScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//if (self.navigationController.navigationBar) {
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    scrollView.frame = CGRectMake(0, CGRectGetMaxY(_scroll.frame), WIDTH, HEIGHT-titleHeight);
//} else {
//    _scroll.frame = CGRectMake(0, 10, WIDTH, 40);
//    scrollView.frame = CGRectMake(0, CGRectGetMaxY(_scroll.frame), WIDTH, HEIGHT-titleHeight);
//}
//scrollView.delegate = self;
//scrollView.backgroundColor = RGBCOLOR(244, 244, 244, 1);
//scrollView.pagingEnabled = YES;
//scrollView.scrollEnabled = YES;
//scrollView.contentSize = CGSizeMake(WIDTH*_vcTotalArray.count, HEIGHT-titleHeight);
//[self.view addSubview:scrollView];
//_scrollView = scrollView;
////不设置弹性 防止滑动返回时 出现页面偏移的问题
//_scrollView.bounces = NO;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
