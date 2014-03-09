//
//  Alarm+Extension.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//

#import "Alarm.h"

typedef void (^CLGeocodeCompletionHandler)(NSArray *placemark, NSError *error);

@interface Alarm (Extensions)
+ (NSString *)entityName;
+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc;
+ (NSInteger) numberOfAlarmsWithManagedObjectContext:(NSManagedObjectContext *)moc;
+ (Alarm *) getFirstAlarmWithManagedObjectContext:(NSManagedObjectContext *)moc;
- (NSString *) displayTime;
- (NSString *) displayRepitions;
- (NSString *) displaySound;
- (void) displayAddress:(CLGeocodeCompletionHandler)completionHander;
- (NSArray *)repetitionsSorted;
- (void) createAlarmNotification;
@end
