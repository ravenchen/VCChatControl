//
//  NibManager.m
//  VCChat
//
//  Created by ravenchen on 1/24/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCChatBubbleUtil.h"
#import "VCChatCellViewHolder.h"
static UIView * cellView;
static VCChatCellViewHolder * cellController;
@implementation VCChatBubbleUtil
+(UIView *) getCell
{
    if(!cellView)
    {
        cellController=[[VCChatCellViewHolder alloc]initWithNibName:@"ChatCellLeftViewController" bundle:nil];
        cellView=cellController.view;
    }
    return cellView;
}
+(CGRect)getCellRect:(BOOL) timeBar
{
    if(timeBar)
    {
        return [VCChatBubbleUtil getCell].frame;
    }
    else
    {
        return [VCChatBubbleUtil getLowerContainerRect];
    }
}
+(CGRect)getChatBgRect;
{
    return [[VCChatBubbleUtil getCell] viewWithTag:14].frame;
}

+(CGRect)getLowerContainerRect
{
    return [[VCChatBubbleUtil getCell] viewWithTag:12].frame;
}
+(CGRect)getChatContainerRect
{
    return [[VCChatBubbleUtil getCell] viewWithTag:13].frame;
}
+(float)getMinChatBgWidth
{
    return 35;
}

+(UIView *)getTextView:(NSString *)str
{
    UIFont * currentFont=[UIFont systemFontOfSize:16];
    float width=[VCChatBubbleUtil getChatBgRect].size.width;
    return [VCCellTextGenerator getTextViewFromString:str font:currentFont width:width];
}
+(float) getTextViewContainerHeight:(UIView *) textView withTimeBar:(BOOL) timeBar
{
    return [VCChatBubbleUtil getCellRect:timeBar].size.height+(textView.frame.size.height-[VCChatBubbleUtil getChatBgRect].size.height);
}
+(UIView *)getLocationView
{
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 70,30)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [view.layer setCornerRadius:5];
    return view;
}
+(UIView *)getRecordingView
{
    return nil;
}
+(UIView *)getImageView
{
    return nil;
}
@end

