//
//  MAViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/12/13.
//

#import <UIKit/UIKit.h>
#import "MAAlarmViewControllerProtocol.h"

@class Alarm;

@interface MAMainViewController : UIViewController
<MAAlarmViewControllerProtocol>

@property NSManagedObjectContext *managedObjectContext;
@property Alarm *alarm;

// buttons
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIButton *repeatButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activationButton;

@end
