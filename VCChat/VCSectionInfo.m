//
//  VCSectionInfo.m
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCSectionInfo.h"

@implementation VCSectionInfo
-(id)init
{
    self=[super init];
    if(self)
    {
        self.cells=[[NSMutableArray alloc]init];
    }
    return self;
}
@end
