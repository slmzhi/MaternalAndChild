//
//  ADView.m
//  MaternalAndChild
//
//  Created by SLM on 15/7/15.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "ADView.h"

@implementation ADView
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}
- (void)creatView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 160)];
    for (int i = 0; i < 4; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenSize.width*i, 0, kScreenSize.width, 160)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3303992133,3208352813&fm=116&gp=0.jpg"]];
        [_scrollView addSubview:imageView];
    }
    _scrollView.contentSize = CGSizeMake(4*kScreenSize.width, 160);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    [self addSubview:_scrollView];
    //页码器
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenSize.width-80, 160-30, 80, 30)];
    _pageControl.numberOfPages = 4;
    
    
    [_pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_pageControl];
}
- (void)pageClick:(UIPageControl *)page {
    //修改滚动视图的偏移量
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width*page.currentPage, 0) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //修改页码
    CGPoint offset = _scrollView.contentOffset;
    _pageControl.currentPage = offset.x/_scrollView.bounds.size.width;
}

@end
