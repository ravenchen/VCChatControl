//
//  VCMapVIewViewController.h
//  Components
//
//  Created by Chen, Qiang on 1/28/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface VCMapVIewViewController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIButton *act;

@end
