//
//  CustomScrollView.h
//  Iplus
//
//  Created by 贵州众智博信 on 2017/9/17.
//  Copyright © 2017年 zzbx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomScrollView : UIScrollView

/**
 1.scrollView的pan手势会让系统的pan手势失效，所以我们只需要在系统手势失效且scrollView的位置在初始位置的时候让两个手势同时启用就可以了
 2.这个CustomScrollView主要是为了解决手势冲突的问题
 
 */

@end
