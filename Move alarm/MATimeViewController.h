//
//  MATimeViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/20/13.
//

#import <UIKit/UIKit.h>
#import "MAAlarmViewControllerProtocol.h"

@interface MATimeViewController : UIViewController

<MAAlarmViewControllerProtocol, UIPickerViewDataSource, UIPickerViewDelegate>
@property NSManagedObjectContext *managedObjectContext;
@property Alarm *alarm;

@property (weak, nonatomic) IBOutlet UIPickerView *timePickerView;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
@end
