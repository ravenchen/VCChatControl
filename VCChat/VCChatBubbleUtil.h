//
//  NibManager.h
//  VCChat
//
//  Created by ravenchen on 1/24/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCCellTextGenerator.h"
@interface VCChatBubbleUtil : NSObject
+(CGRect)getCellRect:(BOOL) timeBar;
+(CGRect)getChatBgRect;
+(CGRect)getChatContainerRect;
+(CGRect)getLowerContainerRect;
+(float)getMinChatBgWidth;

+(UIView *)getTextView:(NSString *)str;
+(float) getTextViewContainerHeight:(UIView *) textView withTimeBar:(BOOL) timeBar;
+(UIView *)getLocationView;
+(UIView *)getRecordingView;
+(UIView *)getImageView;
@end
