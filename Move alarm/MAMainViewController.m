//
//  MAViewController.m
//  Move alarm
//
//  Created by Daniel Sullivan on 10/12/13.
//

#import "MAMainViewController.h"
#import "Alarm.h"
#import "Alarm+Extension.h"
#import "MARepeatViewController.h"
#import "MAAlarmViewControllerProtocol.h"

@interface MAMainViewController ()
@end

@implementation MAMainViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  if ([Alarm numberOfAlarmsWithManagedObjectContext:self.managedObjectContext])
  {
    self.alarm = [Alarm getFirstAlarmWithManagedObjectContext:self.managedObjectContext];
  }
  else
  {
    self.alarm = [Alarm insertNewObjectInManagedObjectContext:self.managedObjectContext];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if (([[segue identifier] isEqualToString:@"ShowTimePickerSegue"]) ||
     ([[segue identifier] isEqualToString:@"ShowLocationPickerSegue"]) ||
     ([[segue identifier] isEqualToString:@"ShowRepeaterSegue"]))
  {
    UIViewController<MAAlarmViewControllerProtocol> *destinationViewController = segue.destinationViewController;
    destinationViewController.managedObjectContext = self.managedObjectContext;
    destinationViewController.alarm = self.alarm;
  }
}

@end
