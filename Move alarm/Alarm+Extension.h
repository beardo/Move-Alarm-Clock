//
//  Alarm+Extension.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//  Copyright (c) 2013 Novelty Software. All rights reserved.
//

#import "Alarm.h"

@interface Alarm (Extension)
+ (NSString *)entityName;
+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc;
+ (NSInteger) numberOfAlarmsWithManagedObjectContext:(NSManagedObjectContext *)moc;
+ (Alarm *) getFirstAlarmWithManagedObjectContext:(NSManagedObjectContext *)moc;
@end