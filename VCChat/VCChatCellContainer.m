//
//  VCChatCellControllerCell.m
//  VCChat
//
//  Created by ravenchen on 1/24/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCChatCellContainer.h"

@implementation VCChatCellContainer

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    //[super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    //
}
-(void) setInfo:(VCCellInfo *) cellInfo
{
    if(!self.LeftViewController)
    {
        self.LeftViewController=[[VCChatCellViewHolder alloc]initWithNibName:@"VCChatCellLeftViewController" bundle:Nil];
        self.RightViewController=[[VCChatCellViewHolder alloc]initWithNibName:@"VCChatCellRightViewController" bundle:Nil];
    }
    else
    {
        if(self.LeftViewController.view.superview!=nil)
        {
            [self.LeftViewController.view removeFromSuperview];
        }
        else if(self.RightViewController.view.superview!=nil)
        {
            [self.RightViewController.view removeFromSuperview];
        }
    }
    UIView * displayView=[[cellInfo getStore] valueForKey:@"displayView"];
    NSString * direction=[[cellInfo getStore] valueForKey:@"Direction"];
    BOOL showTime=[[[cellInfo getStore] valueForKey:@"displayTime"] isEqualToString:@"YES"];
    if(direction&&[direction isEqualToString:@"Left"])
    {
        [self.LeftViewController setDisplayView:displayView];
        [self.LeftViewController reloadView:showTime];
        [self addSubview:self.LeftViewController.view];

    }
    else
    {
        [self.RightViewController setDisplayView:displayView];
        [self.RightViewController reloadView:showTime];
        [self addSubview:self.RightViewController.view];

    }
    //[self.LeftViewController.msgBg.superview.superview setFrame:CGRectMake(0, 0, self.LeftViewController.msgBg.superview.superview.frame.size.width, self.LeftViewController.msgBg.superview.superview.frame.size.height)];
}



@end
