//
//  HYGScrollView.h
//  zzzzz
//
//  Created by 侯英格 on 16/6/16.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 这个意思是 滑动条的方向
 */
typedef NS_ENUM(NSInteger, ScrollViewDiretion) {
    UIScrollViewScrolltoUp,
    UIScrollViewScrolltoDown,
    UIScrollViewScrolltoLeft,
    UIScrollViewScrolltoRight
};

@interface HYGScrollView : UIScrollView

/**在contentsize没有大于frame的情况下上下回弹*/
@property(nonatomic,assign)BOOL isNeedBounces;

@property(nonatomic,assign)ScrollViewDiretion diretion;

/**是否要知道自己的滚动方向*/
-(void)setNeedKnowDiretion;

@end
