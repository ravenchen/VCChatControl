//
//  VCLocationFinder.h
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface VCLocationFinder : NSObject <CLLocationManagerDelegate>
-(void)getLocation;
+(CLLocation *)loc;
@end
