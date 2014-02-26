//
//  Mob.m
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Mob.h"

@implementation Mob

-(id)initMobWithName:(NSString *)name andStatus:(NSInteger)status
{
    if (self = [super init]) {
        self.name = name;
        self.status = status;
    }
    return self;
}

-(UIColor *)statusColor
{
    if (self.status == 0) return [UIColor redColor];
    else return [UIColor greenColor];
}

@end
