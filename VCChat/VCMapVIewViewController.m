//
//  VCMapVIewViewController.m
//  Components
//
//  Created by Chen, Qiang on 1/28/14.
//  Copyright (c) 2014 Chen, Qiang. All rights reserved.
//

#import "VCMapVIewViewController.h"

@interface VCMapVIewViewController ()

@end

@implementation VCMapVIewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.1;
    span.longitudeDelta=0.1;
    CLLocationCoordinate2D location;
    location.latitude=userLocation.coordinate.latitude;
    location.longitude=userLocation.coordinate.longitude;
    region.span=span;
    region.center=location;
    MKPointAnnotation * currentLocation=[[MKPointAnnotation alloc]init];
    [currentLocation setCoordinate:location];
    [self.mapView addAnnotation:currentLocation];
    [self.mapView setRegion:region animated:YES];
    [self.mapView setShowsUserLocation:NO];
    [self.mapView setShowsBuildings:NO];
    [self.mapView setTintColor:[UIColor grayColor]];
    
    MKPlacemark * placeMark=[[MKPlacemark alloc]initWithCoordinate:location addressDictionary:nil];
    MKMapItem * item=[[MKMapItem alloc]initWithPlacemark:placeMark];
    [self.act.layer setValue:item forKey:@"currentLoc"];
    [self.act addTarget:self action:@selector(showMap:) forControlEvents:UIControlEventTouchDown];
    
}
-(IBAction)showMap:(UIButton *)sender
{
    MKMapItem * mapItem=(MKMapItem *)[sender.layer valueForKey:@"currentLoc"];
    NSLog(@"show map");
    [mapItem openInMapsWithLaunchOptions:[NSDictionary dictionaryWithObjectsAndKeys:MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsDirectionsModeKey, nil]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
