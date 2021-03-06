//
//  NSDate+MADateExtensions.m
//  Move alarm
//
//  Created by Daniel Sullivan on 3/7/14.
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
  
  
  if (components.weekday > dayOfTheWeek) {
    DLog(@"next week");
    components.week = components.week + 1;
  }
  components.weekday = dayOfTheWeek;
  components.hour = hour;
  components.minute = minutes;
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
