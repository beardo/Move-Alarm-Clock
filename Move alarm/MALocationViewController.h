//
//  MALocationViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/20/13.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MAAlarmViewControllerProtocol.h"

@interface MALocationViewController : UIViewController
<MAAlarmViewControllerProtocol, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property Alarm *alarm;
@property NSManagedObjectContext *managedObjectContext;

#pragma mark - CLLocationMangerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;

@end
