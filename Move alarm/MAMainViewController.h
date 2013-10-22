//
//  MAViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/12/13.
//

#import <UIKit/UIKit.h>

@interface MAMainViewController : UIViewController

@property NSManagedObjectContext *managedObjectContext;

// buttons
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIButton *repeatButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activationButton;

@end
