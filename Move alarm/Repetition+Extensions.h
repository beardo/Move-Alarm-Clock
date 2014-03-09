//
//  Repetition+Extensions.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/25/13.
//

#import "Repetition.h"

typedef NS_ENUM(NSInteger, MADayOfTheWeek);

@interface Repetition (Extensions)
+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc;
+ (NSString *)entityName;
+ (NSArray *)createRepitionsForDaysWithManagedObjectContext:(NSManagedObjectContext *)moc;
+ (Repetition *) closestRepetitionFromToday:(NSArray *)repetitions;
- (NSString *)displayName;
- (MADayOfTheWeek)dayEnum;
@end
