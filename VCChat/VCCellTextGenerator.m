//
//  UtilManager.m
//  VCChat
//
//  Created by ravenchen on 1/25/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCCellTextGenerator.h"

@implementation VCCellTextGenerator
+(UIView *) getTextViewFromString: (NSString *)str font:(UIFont *) font width:(float)width;
{
    CGRect textRect = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil];
    CGRect sample = [@"_" boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName:font}
                                       context:nil];
    textRect=CGRectMake(textRect.origin.x, textRect.origin.y, MAX(35,textRect.size.width), MAX(22,textRect.size.height));
    sample=CGRectMake(sample.origin.x, sample.origin.y, MAX(35,sample.size.width), MAX(22,sample.size.height));
    
    
    UIView * msgBg=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width, textRect.size.height)];
    if(textRect.size.width<width&&textRect.size.height==sample.size.height)
    {
        [msgBg setFrame:CGRectMake(width-textRect.size.width, 0, textRect.size.width, textRect.size.height)];
    }
    UILabel * label=[[UILabel alloc]initWithFrame:textRect];
    [label setFont:font];
    [label setText:str];
    [label setNumberOfLines:500];
    [label sizeToFit];
    if(sample.size.height==textRect.size.height)
    {
        [label setFrame:CGRectMake(0, 0, label.frame.size.width, MAX(22,label.frame.size.height))];
        [label setTextAlignment:NSTextAlignmentCenter];
    }
    else
    {
        [label setTextAlignment:NSTextAlignmentLeft];
    }
    [label setTextColor:[UIColor whiteColor]];
    NSTextStorage *textStorage=[[NSTextStorage alloc]initWithString:str attributes:@{NSFontAttributeName:font}];
    NSLayoutManager * layoutManager=[[NSLayoutManager alloc]init];
    [textStorage addLayoutManager:layoutManager];
    NSTextContainer * textContainer=[[NSTextContainer alloc]initWithSize:label.frame.size];
    //[textContainer setLineBreakMode:NSLineBreakByCharWrapping];
    [layoutManager addTextContainer:textContainer];
    UITextView * retView=[[UITextView alloc]initWithFrame:label.frame];
    [retView setFont:font];
    [retView setTextContainerInset:UIEdgeInsetsMake(0, -6, 0, -6)];
    [retView setBounces:NO];
    [retView setTextColor:[UIColor whiteColor]];
    [retView setSelectable:YES];
    [retView setDataDetectorTypes:UIDataDetectorTypeAll];
    [retView setScrollEnabled:YES];
    [retView setTextAlignment:label.textAlignment];
    if(textRect.size.width<width&&textRect.size.height==sample.size.height)
    {
        float shift=(msgBg.frame.size.width-retView.frame.size.width)/2.0;
        [retView setFrame:CGRectMake(retView.frame.origin.x+shift, retView.frame.origin.y, retView.frame.size.width, retView.frame.size.height)];
    }
    [retView setBackgroundColor:[UIColor clearColor]];
    [msgBg addSubview:retView];
    [retView setText:str];
    [retView setEditable:NO];
    return msgBg;
}
@end
