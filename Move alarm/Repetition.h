//
//  Repetition.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/25/13.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Alarm;

@interface Repetition : NSManagedObject

@property (nonatomic, retain) NSString * day;
@property (nonatomic, retain) NSNumber * shouldRepeat;
@property (nonatomic, retain) NSNumber * sortValue;
@property (nonatomic, retain) Alarm *alarm;

@end
