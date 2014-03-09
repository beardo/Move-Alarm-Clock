//
//  MASoundPickerViewController.m
//  Move alarm
//
//  Created by Daniel Sullivan on 3/2/14.
//  Copyright (c) 2014 Novelty Software. All rights reserved.
//

#import "MASoundPickerViewController.h"

#import "Alarm+Extensions.h"
#import "MADebugMacros.h"

@interface MASoundPickerViewController ()
@property NSArray *soundFiles;
@end

@implementation MASoundPickerViewController

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
  
  NSArray *filesPaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"wav" inDirectory:@"." ];
  
  NSMutableArray *fileNames = [[NSMutableArray alloc] init];
  
  for (NSString *filePath in filesPaths) {
    NSString *fileName = [[filePath lastPathComponent] stringByDeletingPathExtension];
    [fileNames addObject:fileName];
  }
  
  NSArray *soundFiles = [NSArray arrayWithArray:fileNames];
  self.soundFiles = soundFiles;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.soundFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"SoundFileCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  cell.textLabel.text = [self.soundFiles objectAtIndex:indexPath.row];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
  self.alarm.sound = self.soundFiles[indexPath.row];
  self.alarm.inMusicLibrary = [NSNumber numberWithBool:NO];
  DLog(@"self.alarm = %@", self.alarm);
}



@end
