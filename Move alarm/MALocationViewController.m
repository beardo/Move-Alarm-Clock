//
//  MALocationViewController.m
//  Move alarm
//
//  Created by Daniel Sullivan on 10/20/13.
//

#import "MADebugMacros.h"
#import "Location+Extensions.h"
#import "Alarm+Extensions.h"
#import "MALocationViewController.h"


@interface MALocationViewController ()
@property Location *location;
@property CLLocationManager *locationManager;
@end

@implementation MALocationViewController

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
//  DLog(@"self.managedObjectContext = %@", self.managedObjectContext);
  self.mapView.showsUserLocation = YES;
  self.location = [Location insertNewObjectInManagedObjectContext:self.managedObjectContext];
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated
{
  self.alarm.location = self.location;
  NSError *error = nil;
  [self.managedObjectContext save:&error];
  self.locationManager.delegate = nil;
  if (error) {
    DLog(@"error: %@", error);
  }
  
  [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  // ???: Honestly should probably be passed in from MainViewController
  if (![CLLocationManager locationServicesEnabled]) {
    // TODO: warn the user (should probably happen in MainViewController
    DLog(@"Location services not enabled");
  }
  else
  {
    self.location.longitude = [NSNumber numberWithDouble:(double)self.locationManager.location.coordinate.longitude];
    self.location.latitude = [NSNumber numberWithDouble:(double)self.locationManager.location.coordinate.latitude];
    self.location.accuracy = [NSNumber numberWithDouble:self.locationManager.location.horizontalAccuracy];

    MKCoordinateRegion userRegion;
    userRegion.center = self.locationManager.location.coordinate;
    userRegion.span.latitudeDelta = 1.0/64.0;
    userRegion.span.longitudeDelta = 1.0/64.0;

    [self.mapView setRegion:userRegion animated:YES];
  }
  [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - CLLocationMangerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
  CLLocation *currentLocation = (CLLocation *)locations.lastObject;
  self.location.longitude = [NSNumber numberWithFloat:currentLocation.coordinate.longitude];
  self.location.latitude = [NSNumber numberWithFloat:currentLocation.coordinate.latitude];
  DLog(@"latitude: %@, longitudeDelta: %@", self.location.latitude, self.location.longitude);
}

@end
