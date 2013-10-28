//
//  MAAlarmViewControllerProtocol.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/26/13.
//

#import <Foundation/Foundation.h>

@class Alarm;

@protocol MAAlarmViewControllerProtocol <NSObject>
@property NSManagedObjectContext *managedObjectContext;
@property Alarm *alarm;
@end
