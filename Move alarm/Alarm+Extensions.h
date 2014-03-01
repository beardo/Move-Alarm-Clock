//
//  Alarm+Extension.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//

#import "Alarm.h"

@interface Alarm (Extensions)
+ (NSString *)entityName;
+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc;
+ (NSInteger) numberOfAlarmsWithManagedObjectContext:(NSManagedObjectContext *)moc;
+ (Alarm *) getFirstAlarmWithManagedObjectContext:(NSManagedObjectContext *)moc;
- (NSString *) displayTime;
- (NSString *) displayRepitions;
- (NSArray *)repitionsSorted;
@end
