//
//  MARepeatViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/20/13.
//

#import <UIKit/UIKit.h>
#import "MAAlarmViewControllerProtocol.h"

@interface MARepeatViewController : UITableViewController
<MAAlarmViewControllerProtocol>
@property NSManagedObjectContext *managedObjectContext;
@property Alarm *alarm;
@end
