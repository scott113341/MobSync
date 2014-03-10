//
//  Group.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Group.h"

@implementation Group

// Designated init
- (id)initWithName:(NSString*)name
    AndMembersList:(NSArray*)membersList
{
    if (self = [super init]) {
        self.name = name;
        self.membersList = [NSMutableArray arrayWithArray:membersList];
    }
    return self;
}

@end
