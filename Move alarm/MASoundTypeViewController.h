//
//  MASoundTypeViewController.h
//  Move alarm
//
//  Created by Daniel Sullivan on 3/2/14.
//  Copyright (c) 2014 Novelty Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "MAAlarmViewControllerProtocol.h"

@interface MASoundTypeViewController : UITableViewController
<MAAlarmViewControllerProtocol, MPMediaPickerControllerDelegate>

@property NSManagedObjectContext *managedObjectContext;
@property Alarm *alarm;

@end
