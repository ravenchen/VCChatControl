//
//  VCChatCellInfo.h
//  VCChat
//
//  Created by ravenchen on 1/26/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCCellInfo.h"

@interface VCChatCellInfo : VCCellInfo
-(id)initWithDisplayTime:(BOOL)display Direction:(BOOL)Left Text:(NSString *)text;
-(id)initWithDisplayTime:(BOOL)display Direction:(BOOL)Left View:(UIView *)view;
@end
