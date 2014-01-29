//
//  VCImageCellInfo.m
//  VCChat
//
//  Created by ravenchen on 1/27/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCImageCellInfo.h"
#import "VCImageView.h"
#import "VCOverLay.h"
@implementation VCImageCellInfo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)showOverLayImage
{
    VCImageView * imageView=[[VCImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 443)];
    [imageView setImage:self.image];
    [VCOverLay addOverLay:imageView];
    [[[UIApplication sharedApplication] keyWindow].rootViewController.view endEditing:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
