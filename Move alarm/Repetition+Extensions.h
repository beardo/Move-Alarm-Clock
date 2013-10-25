//
//  Repetition+Extensions.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/25/13.
//  Copyright (c) 2013 Novelty Software. All rights reserved.
//

#import "Repetition.h"

@interface Repetition (Extensions)
+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc;
+ (NSString *)entityName;
+ (NSArray *)createRepitionsForDaysWithManagedObjectContext:(NSManagedObjectContext *)moc;
- (NSString *)displayName;
@end
