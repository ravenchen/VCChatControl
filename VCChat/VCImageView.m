//
//  VCImageView.m
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import "VCImageView.h"
#import "VCHint.h"
@implementation VCImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView=[[UIImageView alloc]initWithFrame:frame];
        [self setDelegate:self];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollEnabled=YES;
    self.minimumZoomScale=1.0f;
    self.maximumZoomScale=10.0f;
    if([self.subviews lastObject]!=self.imageView)
    {
        [self addSubview:self.imageView];
        UIButton * saveBut=[UIButton buttonWithType:UIButtonTypeSystem];
        [saveBut setTitle:@"Save" forState:UIControlStateNormal];
        [saveBut setFrame:CGRectMake(0, self.superview.frame.size.height-30, self.superview.frame.size.width, 31)];
        [saveBut setAdjustsImageWhenHighlighted:YES];
        [saveBut setBackgroundColor:[[UIColor alloc]initWithWhite:1 alpha:0.35f]
         ];
        [saveBut setReversesTitleShadowWhenHighlighted:YES];
        [saveBut addTarget:self action:@selector(savePhoto:) forControlEvents:UIControlEventTouchDown];
        [self.superview addSubview:saveBut];

    }
}
-(IBAction)savePhoto:(id)sender
{
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, nil, Nil, nil);
    VCHint * hint=[[VCHint alloc]initWithStr:@"Saving image..." timeInterval:2.0f];
    (void)hint;
}
-(void)setImage:(UIImage *)img
{
    [self.imageView setImage:img];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
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
