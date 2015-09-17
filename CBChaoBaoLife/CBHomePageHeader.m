//
//  CBHomePageHeader.m
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import "CBHomePageHeader.h"

@implementation CBHomePageHeader

+(instancetype)CBHomePageHeader{
    
    CBHomePageHeader* tgHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"CBHomePageHeader" owner:nil options:nil] lastObject];
    return tgHeaderView;
}


-(void)awakeFromNib{
    [super awakeFromNib];
    
    
    _scrollView.delegate = self;
    
    
    for (int i=0; i<5; i++) {
        UIImageView* imageView = [[UIImageView alloc]init];
        NSString* imgName = [NSString stringWithFormat:@"ad_%02d", i];
        [imageView setImage:[UIImage imageNamed:imgName]];
        [_scrollView addSubview:imageView];
        
        imageView.frame = CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
    }
    
    UIImageView* imageView = [[UIImageView alloc]init];
    [imageView setImage:[UIImage imageNamed:@"ad_00"]];
    imageView.frame = CGRectMake(5*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
    [_scrollView addSubview:imageView];
    
    _scrollView.contentSize = CGSizeMake(6*_scrollView.frame.size.width, _scrollView.frame.size.height);
    _scrollView.pagingEnabled = YES;
    
    _pageControl.numberOfPages = 5;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:4.f target:self selector:@selector(changPage:) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)changPage:(NSTimer*)timer{
    //scrow换页操作
    NSInteger curPageNum = _pageControl.currentPage;
    
    __block NSInteger nextPageNum = curPageNum+1;
    
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = CGPointMake(nextPageNum*_scrollView.frame.size.width, 0);
    } completion:^(BOOL finished) {
        if (nextPageNum == 5) {
            _scrollView.contentOffset = CGPointZero;
            nextPageNum = 0;
        }
        _pageControl.currentPage = nextPageNum;
    }];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer invalidate];
    _timer = nil;
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(changPage:) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger number = (NSInteger)_scrollView.contentOffset.x/_scrollView.frame.size.width;
    _pageControl.currentPage = number;
}


@end
