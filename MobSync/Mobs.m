//
//  Mobs.m
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Mobs.h"

@implementation Mobs

-(id)init
{
    if (self = [super init]) {
        self.all = [[NSMutableArray alloc] init];
        
        [self.all addObject:[[Mob alloc] initMobWithName:@"Mob City" andStatus:0]];
        [self.all addObject:[[Mob alloc] initMobWithName:@"Mob 2.0" andStatus:1]];
    }
    return self;
}

-(Mob *)mobAtIndex:(NSInteger)index
{
    return [self.all objectAtIndex:index];
}

+(id)sharedInstance
{
    static Mob *sharedMob = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMob = [[self alloc] init];
    });
    return sharedMob;
}

@end
