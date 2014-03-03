//
//  MASoundPickerViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 3/2/14.
//  Copyright (c) 2014 Novelty Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAAlarmViewControllerProtocol.h"

#import <MediaPlayer/MediaPlayer.h>

@interface MASoundPickerViewController : UITableViewController <MAAlarmViewControllerProtocol, MPMediaPickerControllerDelegate>

@property NSManagedObjectContext *managedObjectContext;
@property Alarm *alarm;

@end
