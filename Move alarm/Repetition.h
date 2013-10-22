//
//  Repetition.h
//  Move alarm
//
//  Created by Daniel Sullivan on 10/21/13.
//  Copyright (c) 2013 Novelty Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Repetition : NSManagedObject

@property (nonatomic, retain) NSString * day;
@property (nonatomic, retain) NSNumber * shouldRepeat;
@property (nonatomic, retain) NSManagedObject *alarm;

@end
