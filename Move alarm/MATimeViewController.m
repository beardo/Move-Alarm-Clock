//
//  MATimeViewController.m
//  Move alarm
//
//  Created by Daniel Sullivan on 10/20/13.
//

#import "MATimeViewController.h"
#import "Alarm.h"
#import "Alarm+Extension.h"
#import "NSManagedObject+Extensions.h"
#import "MADebugMacros.h"

@interface MATimeViewController ()
@property NSNumber *hour;
@property NSNumber *minute;

@property (readonly) NSUInteger numberOfHours;
@property (readonly) NSUInteger numberOfMinutes;

- (void) resetTimePickerToMiddle:(NSUInteger)hour minutes:(NSUInteger)minutes;
@end

@implementation MATimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

#pragma mark = View lifecycle methods
- (void)viewDidLoad
{
  [super viewDidLoad];
  _numberOfHours = 24;
  _numberOfMinutes = 60;

  self.hour = self.alarm.hour;
  self.minute = self.alarm.minute;
  
  // If the user hasn't saved any alarms use 7:30 AM as the default
  if ([self.alarm isNew])
  {
    DLog(@"[self.alarm isNew]");
    self.hour = [NSNumber numberWithInteger:7];
    self.minute = [NSNumber numberWithInteger:30];
  }
  [self resetTimePickerToMiddle:[self.hour integerValue] minutes:[self.minute integerValue]];
}

- (void)viewWillDisappear:(BOOL)animated
{
  self.hour = [NSNumber numberWithInt:[self.timePickerView selectedRowInComponent:0] % self.numberOfHours];
  self.minute = [NSNumber numberWithInt:[self.timePickerView selectedRowInComponent:1] % self.numberOfMinutes];
  self.alarm.hour = self.hour;
  self.alarm.minute = self.minute;
}

- (void) resetTimePickerToMiddle:(NSUInteger)hour minutes:(NSUInteger)minutes
{
  [self.timePickerView selectRow:((UINT16_MAX)/(2 * self.numberOfHours) * self.numberOfHours) + hour inComponent:0 animated:NO];
  [self.timePickerView selectRow:((UINT16_MAX)/(2 * self.numberOfMinutes) * self.numberOfMinutes) + minutes inComponent:1 animated:NO];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  // We want to recreate the circular scrolling that the default clock app has
  return UINT16_MAX;
}

#pragma mark - UIPickerViewDelegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  NSUInteger displayNumber = 0;
  if (component == 0)
  {
    displayNumber = row % self.numberOfHours;
  }
  else
  {
    displayNumber = row % self.numberOfMinutes;
  }
  
  return [NSString stringWithFormat:@"%lu", (unsigned long)displayNumber];
}

@end
