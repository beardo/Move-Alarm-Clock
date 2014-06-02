//
//  Location+Extensions.m
//  Move alarm
//
//  Created by Daniel Sullivan on 2/28/14.
//


#import "Location+Extensions.h"
#import "MADebugMacros.h"
#import <CoreLocation/CoreLocation.h>

@implementation Location (Extensions)
#pragma mark - Class Methods
+ (NSString *)entityName
{
  return @"Location";
}

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc
{
  return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                       inManagedObjectContext:moc];
}

- (CLLocation *) locationFromString: (NSString *)string completionHandler:(CLGeocodeCompletionHandler)completionHander;
{
  // TODO:
  return nil;
}

- (void) address: (CLGeocodeCompletionHandler)completionHandler
{
  DLog(@"");
  CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
  CLLocation *location = [[CLLocation alloc] initWithLatitude:[self.latitude doubleValue]
                                                    longitude:[self.longitude doubleValue]];
  
  [geoCoder reverseGeocodeLocation:location completionHandler:completionHandler];
}

@end
