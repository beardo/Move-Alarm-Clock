//
//  NSManagedObject+Extensions.m
//  Move alarm
//
//  Created by Daniel Sullivan on 10/27/13.
//

#import "NSManagedObject+Extensions.h"

@implementation NSManagedObject (Extensions)
- (BOOL) isNew
{
  NSDictionary *vals = [self committedValuesForKeys:nil];
  return [vals count] == 0;
}
@end
