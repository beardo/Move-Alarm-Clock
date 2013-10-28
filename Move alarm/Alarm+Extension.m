//
//  Alarm+Extension.m
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//

#import "Alarm+Extension.h"


@implementation Alarm (Extension)

#pragma mark - Class Methods
+ (NSString *)entityName
{
  return @"Alarm";
}

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc
{
  return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                       inManagedObjectContext:moc];
}

+ (NSInteger) numberOfAlarmsWithManagedObjectContext:(NSManagedObjectContext *)moc
{
  NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
  NSError *error = nil;
  
  NSUInteger count = [moc countForFetchRequest:request error:&error];
  
  if (!error)
  {
    return count;
  }
  else
  {
    return  -1;
  }
}

+ (Alarm *) getFirstAlarmWithManagedObjectContext:(NSManagedObjectContext *)moc
{
  Alarm *alarm = nil;
  
  NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
  NSError *error = nil;
  
  NSArray *alarms = [moc executeFetchRequest:request error:&error];
  
  if (!error && [alarms count]) {
    alarm = alarms.firstObject;
  }
  return alarm;
}

@end
