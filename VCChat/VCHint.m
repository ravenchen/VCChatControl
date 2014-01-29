//
//  VCHint.m
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import "VCHint.h"

@implementation VCHint

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithStr:(NSString *) text timeInterval:(float) time
{
    self=[super initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-60, [[UIScreen mainScreen] bounds].size.width, 25)];
    if(self)
    {
       
    }
    [self setAlpha:0.0f];
    UILabel * label=[[UILabel alloc]initWithFrame:self.frame];
    label.text=text;
    [label sizeToFit];
    [self setFrame:CGRectMake(([[UIApplication sharedApplication] keyWindow].frame.size.width-label.frame.size.width)/2.0, label.frame.origin.y, label.frame.size.width, 25)];
    [label setFrame:CGRectMake(0, 0, label.frame.size.width, label.frame.size.height)];
    [self addSubview:label];
    [label setTextColor:[UIColor lightGrayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [UIView animateWithDuration:0.3 animations:^{
       
        [self setAlpha:1.0];
        [self.layer setCornerRadius:10.0];
        [self.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.layer setShadowOpacity:1];
        [self.layer setShadowRadius:5];
        [label setFont:[UIFont systemFontOfSize:14]];
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        [self setBackgroundColor:[UIColor whiteColor]];
    } completion:^(BOOL finished) {
        [self performSelector:@selector(dismiss:) withObject:self afterDelay:time];
    }];
return self;
}
-(IBAction)dismiss:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
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
