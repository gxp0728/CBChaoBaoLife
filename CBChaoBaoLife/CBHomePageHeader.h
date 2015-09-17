//
//  CBHomePageHeader.h
//  CBChaoBaoLife
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 gxp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBHomePageHeader : UIView<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) NSTimer* timer;

+(instancetype)CBHomePageHeader;
@end
