//
//  VCOverLay.m
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import "VCOverLay.h"
#import <QuartzCore/QuartzCore.h>
@implementation VCOverLay
static UIWindow * window;
+(void)addOverLay:(UIView *)view
{
    if(!window)
    {
        window=[[UIApplication sharedApplication] keyWindow];
    }
    if([window.rootViewController.view.layer valueForKey:@"overlay"])
    {
        return;
    }
    [window.rootViewController.view.layer setValue:@"enabled" forKey:@"overlay"];
    UIView * overlay=[self SnapShot];
    UIView * topView=[[UIView alloc]initWithFrame:CGRectMake(20, 100, window.frame.size.width-40,window.frame.size.height-80)];
    [topView setBackgroundColor:[UIColor whiteColor]];
    [topView.layer setShadowColor:[UIColor grayColor].CGColor];
    [topView.layer setShadowOpacity:0.7];
    [topView.layer setShadowRadius:4.0];
    [topView.layer setShadowOffset:CGSizeMake(0, 0)];
    UIButton * close=[[UIButton alloc]initWithFrame:CGRectMake(topView.frame.size.width-35, 10, 25, 25)];
    UILabel * title=[[UILabel alloc]initWithFrame:CGRectMake(0, 12, topView.frame.size.width-35, 25)];
    [title setText:@"title"];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setTextColor:[UIColor grayColor]];
    [close setTitle:@"x" forState:UIControlStateNormal];
    [close setBackgroundColor:[UIColor lightGrayColor]];
    [close.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:17]];
    [close.layer setCornerRadius:12.5f];
    [close addTarget:self action:@selector(removeOverLay:) forControlEvents:UIControlEventTouchDown];
    UIView * topbarBG=[[UIView alloc]initWithFrame:CGRectMake(0, 0, topView.frame.size.width, 45)];
    UIView * contentView=[[UIView alloc]initWithFrame:CGRectMake(0, topbarBG.frame.size.height+1, topView.frame.size.width, topView.frame.size.height-45-1)];
    [topbarBG setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    NSLog(@"content size: width- %f height- %f",topView.frame.size.width,contentView.frame.size.height);
    [contentView addSubview:view];
    [topView addSubview:contentView];
    [topView addSubview:topbarBG];
    [topView addSubview:close];
    [topView addSubview:title];
    UIView * line=[[UIView alloc]initWithFrame:CGRectMake(0, topbarBG.frame.size.height-1, topbarBG.frame.size.width, 1)];
    [line setBackgroundColor:[[UIColor alloc]initWithWhite:0.9 alpha:1.f]];
    [topbarBG addSubview:line];
    
    [overlay addSubview:topView];
    [overlay setAlpha:0.0f];
    [window.rootViewController.view addSubview:overlay];
    [UIView animateWithDuration:0.4f animations:^{
        [overlay setAlpha:1.0f];
        [topView setFrame:CGRectMake(20, 40, window.frame.size.width-40,window.frame.size.height-80)];
        [overlay setUserInteractionEnabled:YES];
        [topView setUserInteractionEnabled:YES];
    } completion:^(BOOL finished) {
    }];
    
}
+(void)removeOverLay:(id)sender
{
    [UIView animateWithDuration:0.4f animations:^{
        [[[window.rootViewController.view subviews] lastObject] setAlpha:0.0];
    } completion:^(BOOL finished) {
        [[[window.rootViewController.view subviews] lastObject] removeFromSuperview];
        [window.rootViewController.view.layer setValue:nil forKey:@"overlay"];
    }];
}
+(UIImageView *)SnapShot
{
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 1);
    [window.rootViewController.view drawViewHierarchyInRect:window.frame afterScreenUpdates:NO];
    UIImage * snapshot=UIGraphicsGetImageFromCurrentImageContext();
    snapshot=[snapshot applyBlurWithRadius:3.0f tintColor:[UIColor clearColor] saturationDeltaFactor:1.0f maskImage:snapshot];
    UIGraphicsEndImageContext();
    UIImageView * ret=[[UIImageView alloc]initWithImage:snapshot];
    return ret;
}

@end
