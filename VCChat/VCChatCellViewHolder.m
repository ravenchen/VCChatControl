//
//  OUViewController.m
//  Components
//
//  Created by Chen, Qiang on 1/23/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import "VCChatCellViewHolder.h"
#import "VCChatBubbleUtil.h"
#import "VCCellTextGenerator.h"
@interface VCChatCellViewHolder ()

@end

@implementation VCChatCellViewHolder

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.avatarName setText:@"Vincent Chen"];
    [self.status setText:@"Deliv"];
    //[self.avatar.layer setMasksToBounds:YES];
    //[self.avatar.layer setCornerRadius:18];
    // Do any additional setup after loading the view from its nib.
}
- (void) reloadView:(BOOL)displayTime
{
    [self.view setHidden:NO];
    [self.displayView setFrame:CGRectMake(0,0,MAX(self.displayView.frame.size.width,35),MAX(self.displayView.frame.size.height,22))];
    UIView * topView=[[self.msgBg subviews] lastObject];
    // remove the old msg
    if([topView.layer valueForKey:@"topView"])
    {
        [topView removeFromSuperview];
    }
    // restore the msgContainer
    if([self.nibName isEqualToString:@"VCChatCellRightViewController"])
    {
        self.originalFrame=CGRectMake(71,0,199,40);
    }
    else
    {
        self.originalFrame=[VCChatBubbleUtil getChatContainerRect];
    }
    [self.msgBg.superview setFrame:self.originalFrame];
    // move the msgBg to right position
    float moveLeft=0;
    if([self.nibName isEqualToString:@"VCChatCellRightViewController"])
    {
        moveLeft=(self.msgBg.frame.size.width-self.displayView.frame.size.width);
        
    }
    else
    {
        //NSLog(@"not working now, but it is ok");
        if(self.LeftBottomCorner&&self.LeftBottomCorner.image.imageOrientation!=UIImageOrientationUpMirrored)
        {
            [self.LeftBottomCorner setImage:[UIImage imageWithCGImage:self.LeftBottomCorner.image.CGImage
                                                            scale:self.LeftBottomCorner.image.scale orientation: UIImageOrientationUpMirrored]];
            [self.RightBottomCorner setImage:[UIImage imageWithCGImage:self.RightBottomCorner.image.CGImage
                                                             scale:self.RightBottomCorner.image.scale orientation: UIImageOrientationUpMirrored]];
        }
    }
    float diffHeight=self.displayView.frame.size.height-self.msgBg.frame.size.height;
    [self.msgBg.superview setFrame:CGRectMake(self.msgBg.superview.frame.origin.x+moveLeft, self.msgBg.superview.frame.origin.y, self.msgBg.superview.frame.size.width-(self.msgBg.frame.size.width-self.displayView.frame.size.width), self.msgBg.superview.frame.size.height+diffHeight)];
    [self.msgBg addSubview:self.displayView];
    UIView * lowerContainer=self.msgBg.superview.superview;
    if(displayTime)
    {
        [lowerContainer setFrame:CGRectMake(lowerContainer.frame.origin.x, [VCChatBubbleUtil getLowerContainerRect].origin.y, lowerContainer.frame.size.width, lowerContainer.frame.size.height)];
    }
    else
    {
        [lowerContainer setFrame:CGRectMake(lowerContainer.frame.origin.x, 0, lowerContainer.frame.size.width, lowerContainer.frame.size.height)];
    }
    
    [self.displayView.layer setValue:@"" forKey:@"topView"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
