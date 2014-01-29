//
//  VCTableInfo.m
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCTableInfo.h"

@implementation VCTableInfo
-(id)init
{
    self=[super init];
    if(self)
    {
        self.sections=[[NSMutableArray alloc]init];
        self.rowRemoveAnimation=REMOVE_SLIDELEFT_TRANSPARENT;
        self.rowDisplayAnimation=DISPLAY_NONE;
    }
    return self;
}
@end
