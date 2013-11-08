//
//  MAAppDelegate.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/12/13.
//

#import <UIKit/UIKit.h>

@interface MAAppDelegate : UIResponder <UIApplicationDelegate>

@property NSURL* storeUrl;
@property (strong, nonatomic) UIWindow *window;
@property (strong) NSManagedObjectContext *managedObjectContext;
@property (strong) NSManagedObjectModel *managedObjectModel;
@property (strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong) NSURL *storeURL;

@end
