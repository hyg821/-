//
//  HYGScrollView.m
//  zzzzz
//
//  Created by 侯英格 on 16/6/16.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGScrollView.h"

@interface HYGScrollView()
@property(nonatomic,assign)BOOL isSetObserver;
@property(nonatomic,assign)CGFloat lastOffset;
@end

@implementation HYGScrollView

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.isNeedBounces==YES) {
        if (self.contentSize.height<=self.frame.size.height) {
            self.contentSize=CGSizeMake(self.frame.size.width, self.frame.size.height+0.5);
        }
    }
}

-(void)setNeedKnowDiretion{
    self.isSetObserver=YES;
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    CGFloat thisOffset=self.contentOffset.y;
    if (thisOffset-self.lastOffset>0.5) {
        self.diretion=UIScrollViewScrolltoDown;
    }else if (thisOffset-self.lastOffset<0.5){
        self.diretion=UIScrollViewScrolltoUp;
    }
    self.lastOffset=thisOffset;
}

-(void)dealloc{
    if (self.isSetObserver==YES) {
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
}


@end
