//
//  NSDate+MADateExtensions.h
//  Move alarm
//
//  Created by Daniel Sullivan on 3/7/14.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MADayOfTheWeek) {
  MASunday = 1,
  MAMonday,
  MATuesday,
  MAWednesday,
  MAThursday,
  MAFriday,
  MASaturday,
  MAInvalidDay
};

@interface NSDate (MADateExtensions)

+ (NSDate *) dateFromNext:(MADayOfTheWeek)dayOfTheWeek atHour:(NSUInteger)hour atMinutes:(NSUInteger)minutes;
+ (MADayOfTheWeek) dayEnumFromString:(NSString *)string;
@end
