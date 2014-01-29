//
//  VCLocationWrapper.m
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import "VCLocationWrapper.h"
#import "VCLocationFinder.h"
static VCLocationFinder * finder;
@implementation VCLocationWrapper
+(void)getLocation
{
    [NSTimer scheduledTimerWithTimeInterval:5 target:[VCLocationWrapper class] selector:@selector(updateLocation) userInfo:nil repeats:YES];
}
+(void)updateLocation
{
    if(!finder)
    {
        finder=[[VCLocationFinder alloc]init];
    }
     [finder getLocation];
}
@end
