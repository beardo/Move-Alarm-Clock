//
//  Location.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//  Copyright (c) 2013 Novelty Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject

@property (nonatomic, retain) NSNumber * accuracy;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *alarm;

@end
