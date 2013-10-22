//
//  Alarm.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//  Copyright (c) 2013 Novelty Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location, Repetition;

@interface Alarm : NSManagedObject

@property (nonatomic, retain) NSNumber * hour;
@property (nonatomic, retain) NSNumber * minute;
@property (nonatomic, retain) NSNumber * on;
@property (nonatomic, retain) NSString * sound;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) Repetition *repetition;

@end
