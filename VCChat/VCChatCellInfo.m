//
//  VCChatCellInfo.m
//  VCChat
//
//  Created by ravenchen on 1/26/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCChatCellInfo.h"
#import "VCChatBubbleUtil.h"
@implementation VCChatCellInfo
-(id)initWithDisplayTime:(BOOL)display Direction:(BOOL)Left Text:(NSString *)text
{
    self=[super init];
    if(self)
    {
        if(display)
        {
            [[self getStore] setValue:@"YES" forKey:@"displayTime"];
        }
        else
        {
            [[self getStore] setValue:@"NO" forKey:@"displayTime"];
        }
        
        if(Left)
        {
            [[self getStore] setValue:@"Left" forKey:@"Direction"];
        }
        else
        {
            [[self getStore] setValue:@"Right" forKey:@"Direction"];
        }
        UIView * textView=[VCChatBubbleUtil getTextView:text];
        [[self getStore] setValue:textView forKey:@"displayView"];
        [self setAttributesCellIdentifier:@"VCChatCellContainer" Height:[VCChatBubbleUtil getTextViewContainerHeight:textView withTimeBar:[[[self getStore] valueForKey:@"displayTime"] isEqualToString:@"YES"]] Title:Nil subTitle1:nil subTitle2:nil BigIcon:nil  smallIcon:nil];
    }
    return self;
}

-(id)initWithDisplayTime:(BOOL)display Direction:(BOOL)Left View:(UIView *)view
{
    self=[super init];
    if(self)
    {
        if(display)
        {
            [[self getStore] setValue:@"YES" forKey:@"displayTime"];
        }
        else
        {
            [[self getStore] setValue:@"NO" forKey:@"displayTime"];
        }
        
        if(Left)
        {
            [[self getStore] setValue:@"Left" forKey:@"Direction"];
        }
        else
        {
            [[self getStore] setValue:@"Right" forKey:@"Direction"];
        }
        UIView * textView=view;
        [[self getStore] setValue:textView forKey:@"displayView"];
        [self setAttributesCellIdentifier:@"VCChatCellControllerCell" Height:[VCChatBubbleUtil getTextViewContainerHeight:textView withTimeBar:[[[self getStore] valueForKey:@"displayTime"] isEqualToString:@"YES"]] Title:Nil subTitle1:nil subTitle2:nil BigIcon:nil  smallIcon:nil];
    }
    return self;
}
@end
