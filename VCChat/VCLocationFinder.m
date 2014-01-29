//
//  VCLocationFinder.m
//  Components
//
//  Created by Chen, Qiang on 1/27/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import "VCLocationFinder.h"
static CLLocationManager * locationManager;
static CLLocation * currentLocation;
@implementation VCLocationFinder
-(void)getLocation
{
    if(!locationManager)
    {
        locationManager=[[CLLocationManager alloc]init];
        locationManager.delegate=self;
        locationManager.distanceFilter=kCLDistanceFilterNone;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    }
    [locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * location=(CLLocation *)[locations lastObject];
    currentLocation=location;
    NSLog(@"%@",location);
    [locationManager stopUpdatingLocation];
}
+(CLLocation *)loc
{
    return currentLocation;
}
@end
