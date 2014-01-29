//
//  VCBaseStore.m
//  VCChat
//
//  Created by ravenchen on 1/21/14.
//  Copyright (c) 2014 ravenchen. All rights reserved.
//

#import "VCBaseStore.h"

@implementation VCBaseStore
-(NSMutableDictionary *) getStore
{
    if(!self.dataStore)
    {
        self.dataStore=[[NSMutableDictionary alloc]init];
    }
    return self.dataStore;
}
@end
