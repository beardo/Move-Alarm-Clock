//
//  NSManagedObject+Extensions.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/27/13.
//  Copyright (c) 2013 Novelty Software. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Extensions)
/*!
 @method isNew
 @abstract   Returns YES if this managed object is new and has not yet been saved yet into the persistent store.
 */
- (BOOL) isNew;
@end
