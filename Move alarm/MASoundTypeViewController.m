//
//  MASoundTypeViewController.m
//  Move alarm
//
//  Created by Daniel Sullivan on 3/2/14.
//  Copyright (c) 2014 Novelty Software. All rights reserved.
//

#import "MASoundTypeViewController.h"

#import "MADebugMacros.h"
#import "Alarm+Extensions.h"

@interface MASoundTypeViewController ()

@end

@implementation MASoundTypeViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewController
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return 2;
}

#pragma mark - Navigation
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  DLog(@"indexPath = %@", indexPath);
  DLog(@"indexPath.row = %ld", (long)indexPath.row);
  if (indexPath.row == 1) {
    MPMediaPickerController *picker =
    [[MPMediaPickerController alloc]
     initWithMediaTypes: MPMediaTypeAnyAudio];
    
    [picker setDelegate: self];
    [picker setAllowsPickingMultipleItems: NO];
    picker.prompt =
    NSLocalizedString (@"Add songs to play",
                       "Prompt in media item picker");
    
    [self presentViewController:picker animated:YES completion:nil];
  }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"ShowSoundPickerSegue"])
  {
    UIViewController<MAAlarmViewControllerProtocol> *destinationViewController = segue.destinationViewController;
    destinationViewController.managedObjectContext = self.managedObjectContext;
    destinationViewController.alarm = self.alarm;
  }
}

#pragma mark - MPMediaPickerControllerDelegate methods
- (void) mediaPicker: (MPMediaPickerController *) mediaPicker
   didPickMediaItems: (MPMediaItemCollection *) collection {

  MPMediaItem *item = collection.items.firstObject;
  self.alarm.sound = [item valueForProperty:MPMediaItemPropertyTitle];
  self.alarm.inMusicLibrary = [NSNumber numberWithBool:YES];
}

- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker {
  
  [self dismissViewControllerAnimated:YES completion:nil];
}


@end
