//
//  MARepeatViewController.m
//  Move alarm
//
//  Created by Daniel Sullivan on 10/20/13.
//

#import "MARepeatViewController.h"
#import "Alarm.h"
#import "Repetition.h"
#import "Repetition+Extensions.h"

@interface MARepeatViewController ()
@property NSArray *repititions;
@end

@implementation MARepeatViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSSortDescriptor *repetitionDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"sortValue"
                                                                         ascending:YES];
  NSArray *sortDescriptors = @[repetitionDescriptor];
  self.repititions = [self.alarm.repetitions sortedArrayUsingDescriptors:sortDescriptors];
  if (![self.repititions count])
  {
    self.repititions = [Repetition createRepitionsForDaysWithManagedObjectContext:self.managedObjectContext];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return [self.repititions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentitfier = @"AlarmRepeatCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentitfier
                                                          forIndexPath:indexPath];

  Repetition *repition = self.repititions[indexPath.row];
  cell.textLabel.text = repition.displayName;

  if ([repition.shouldRepeat boolValue])
  {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  }
  else
  {
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  return cell;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
  Repetition *repition = self.repititions[indexPath.row];
  repition.shouldRepeat = [NSNumber numberWithBool:![repition.shouldRepeat boolValue]];
  [tableView reloadData];
}

@end
