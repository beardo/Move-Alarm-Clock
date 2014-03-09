//
//  NSDate+MADateExtensions.m
//  Move alarm
//
//  Created by Daniel Sullivan on 3/7/14.
//  Copyright (c) 2014 Novelty Software. All rights reserved.
//

#import "NSDate+MADateExtensions.h"
#import "MADebugMacros.h"

@implementation NSDate (MADateExtensions)
+ (NSDate *) dateFromNext:(MADayOfTheWeek)dayOfTheWeek atHour:(NSUInteger)hour atMinutes:(NSUInteger)minutes
{
  NSDate *today = [NSDate date];
  NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  gregorianCalendar.locale = [NSLocale currentLocale];
  
  NSDateComponents *components = [gregorianCalendar components:NSYearCalendarUnit |
                                    NSWeekCalendarUnit | NSHourCalendarUnit | NSWeekdayCalendarUnit |
                                    NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:today];
  
  
  DLog(@"components.weekday = %d", components.weekday);
  DLog(@"dayOfTheWeek = %d", dayOfTheWeek);
  if (components.weekday > dayOfTheWeek) {
    DLog(@"next week");
    components.week = components.week + 1;
  }
  components.weekday = dayOfTheWeek;

  components.hour = hour;
  DLog(@"components.hour = %d", components.hour);
  components.minute = minutes;
  DLog(@"components.minutes = %d", components.minute);
  components.second = 0;

  return [gregorianCalendar dateFromComponents:components];
}

+ (MADayOfTheWeek) dayEnumFromString:(NSString *)string
{
  if ([@"Sunday" isEqualToString:string]) {
    return MASunday;
  }
  else if ([@"Monday" isEqualToString:string]) {
    return MAMonday;
  }
  else if ([@"Tuesday" isEqualToString:string]){
    return MATuesday;
  }
  else if ([@"Wednesday" isEqualToString:string]) {
    return MAWednesday;
  }
  else if ([@"Thursday" isEqualToString:string]) {
    return MAThursday;
  }
  else if ([@"Friday" isEqualToString:string]) {
    return MAFriday;
  }
  else if ([@"Saturday" isEqualToString:string]) {
    return MASaturday;
  }
  else {
    return MAInvalidDay;
  }
}



@end
