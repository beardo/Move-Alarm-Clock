//
//  Location+Extensions.h
//  Move alarm
//
//  Created by Daniel Sullivan on 2/28/14.
//  Copyright (c) 2014 Novelty Software. All rights reserved.
//

#import "Location.h"

// forward declaration
@class CLLocation;
typedef void (^CLGeocodeCompletionHandler)(NSArray *placemark, NSError *error);

@interface Location (Extensions)
+ (NSString *)entityName;
+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc;
- (void) address: (CLGeocodeCompletionHandler)completionHandler;
- (CLLocation *) locationFromString: (NSString *)string completionHandler:(CLGeocodeCompletionHandler)completionHander;
@end
