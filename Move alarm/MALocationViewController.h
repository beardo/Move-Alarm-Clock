//
//  MALocationViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/20/13.
//

#import <UIKit/UIKit.h>
#import "MAAlarmViewControllerProtocol.h"

@interface MALocationViewController : UIViewController
<MAAlarmViewControllerProtocol>

@property Alarm *alarm;
@property NSManagedObjectContext *managedObjectContext;

@end
