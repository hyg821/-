//
//  ViewController.m
//  TableView HeaderView悬停效果
//
//  Created by 侯英格 on 16/6/21.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ViewController.h"
#import "HYGScrollView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,assign)CGFloat xxxx;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=YES;
    
    HYGScrollView*scrollView=[HYGScrollView new];
    scrollView.tag=10;
    [scrollView setNeedKnowDiretion];
    scrollView.frame=self.view.frame;
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width, 4000);
    scrollView.backgroundColor=[UIColor greenColor];
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    
    
    UIView*ordinarView=[UIView new];
    ordinarView.frame=CGRectMake(0, 0, self.view.frame.size.width, 500);
    ordinarView.backgroundColor=[UIColor yellowColor];
    [scrollView addSubview:ordinarView];
    
    
    UIView*topView=[UIView new];
    topView.tag=1;
    topView.frame=CGRectMake(0, 500, self.view.frame.size.width, 50);
    topView.backgroundColor=[UIColor blueColor];
    [scrollView addSubview:topView];
    
    self.xxxx=topView.frame.origin.y;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIView*view=[scrollView viewWithTag:1];
    
    //topView在屏幕坐标系的里绝对位置
    CGRect rect= [scrollView convertRect:view.frame toView:self.view];
    
    HYGScrollView*sv=(HYGScrollView*)scrollView;
    
    
    CGFloat autoOffSetY;
    CGFloat autoOverallOffSetY;
    if (self.navigationController.navigationBar.hidden==NO&&self.automaticallyAdjustsScrollViewInsets==YES) {
        autoOffSetY=scrollView.contentInset.top;
        autoOverallOffSetY=autoOffSetY+scrollView.contentOffset.y;
    }else{
        autoOffSetY=0;
        autoOverallOffSetY=scrollView.contentOffset.y;
    }
    
    
    
    //如果滚动条是向下的
    if (sv.diretion==UIScrollViewScrolltoDown) {
        //如果topView在屏幕坐标系的位置<=0 这个位置是需要调整的 也就是说想在哪悬停 就把0改成多少
        if (rect.origin.y<=autoOffSetY) {
            //那么 topView 就随着scrollview一起滚动 才能保证悬停
            view.frame=CGRectMake(0, scrollView.contentOffset.y+autoOffSetY,view.frame.size.width,view.frame.size.height);
        }
    }
    //如果滚动条是向上的 就会出现两种情况
    else{
        //第一种是 topView到达了原来的位置
        if (autoOverallOffSetY<=self.xxxx) {
            view.frame=CGRectMake(0, self.xxxx, self.view.frame.size.width, view.frame.size.height);
        }
        //第二种是 topView还没有到达原来的位置的时候
        else{
            view.frame=CGRectMake(0,scrollView.contentOffset.y+autoOffSetY,view.frame.size.width, view.frame.size.height);
        }
    }
}


@end
