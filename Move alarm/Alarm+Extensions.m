//
//  Alarm+Extension.m
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//

#import "Alarm+Extensions.h"
#import "Repetition+Extensions.h"
#import "Location+Extensions.h"
#import "MADebugMacros.h"
#import <CoreLocation/CoreLocation.h>


@implementation Alarm (Extensions)

#pragma mark - Class Methods
+ (NSString *)entityName
{
  return @"Alarm";
}

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc
{
  Alarm *alarm = [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                               inManagedObjectContext:moc];
  alarm.hour = [NSNumber numberWithInt:6];
  alarm.minute = [NSNumber numberWithInt:0];
  
  return alarm;
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

#pragma mark - Display Methods
- (NSString *) displayTime
{
  if (self.minute.integerValue) {
    DLog(@"%@", [[[self.hour stringValue] stringByAppendingString:@":"] stringByAppendingString:[self.minute stringValue]]);
    return [[[self.hour stringValue] stringByAppendingString:@":"] stringByAppendingString:[self.minute stringValue]];
  }
  else {
    DLog(@"%@", [[[self.hour stringValue] stringByAppendingString:@":"] stringByAppendingString:@"00"]);
    return [[[self.hour stringValue] stringByAppendingString:@":"] stringByAppendingString:@"00"];
  }
}

- (NSString *) displayRepitions
{
  DLog("");
  NSString *displayString = @"";
  NSArray *repetitions = self.repitionsSorted;
  for (Repetition *repetition in repetitions) {
    if ([repetition.shouldRepeat boolValue]) {
      if ([repetition.day isEqualToString:@"Sunday"]) {
        displayString = [displayString stringByAppendingString:@"Sun"];
      }
      else if ([repetition.day isEqualToString:@"Monday"])
      {
        displayString = [displayString stringByAppendingString:@" M"];
      }
      else if ([repetition.day isEqualToString:@"Tuesday"])
      {
        displayString = [displayString stringByAppendingString:@" T"];
      }
      else if ([repetition.day isEqualToString:@"Wednesday"])
      {
        displayString = [displayString stringByAppendingString:@" W"];
      }
      else if([repetition.day isEqualToString:@"Thursday"])
      {
        displayString = [displayString stringByAppendingString:@" TH"];
      }
      else if([repetition.day isEqualToString:@"Friday"])
      {
        displayString = [displayString stringByAppendingString:@" F"];
      }
      else if([repetition.day isEqualToString:@"Saturday"])
      {
        displayString = [displayString stringByAppendingString:@" Sat"];
      }
    }
  }
  
  displayString = [displayString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  
  if ([displayString isEqualToString:@"Sun M T W TH F Sat"]) {
    displayString = @"Everyday";
  }
  else if ([displayString isEqualToString:@"Sun Sat"])
  {
    displayString = @"Weekends";
  }
  else if ([displayString isEqualToString:@"M T W TH F"])
  {
    displayString = @"Weekdays";
  }
  else if ([displayString isEqualToString:@""])
  {
    displayString = @"Never";
  }
  DLog(@"%@", displayString);
  return displayString;
}

- (void) displayAddress:(CLGeocodeCompletionHandler)completionHander
{
  [self.location address:completionHander];
}

- (NSString *) displaySound
{
  DLog(@"self.sound = %@", self.sound);
  if (self.sound)
  {
    return self.sound;
  }
  else
  {
    return @"Alarm";
  }
}

- (NSArray *)repitionsSorted
{
  NSSortDescriptor *repetitionDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"sortValue"
                                                                         ascending:YES];
  NSArray *sortDescriptors = @[repetitionDescriptor];
  return [self.repetitions sortedArrayUsingDescriptors:sortDescriptors];
}

@end
