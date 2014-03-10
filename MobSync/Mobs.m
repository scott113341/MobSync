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
        self.defaults = [NSUserDefaults standardUserDefaults];
        [self load];
    }
    return self;
}

-(Mob *)mobAtIndex:(NSInteger)index
{
    return [self.all objectAtIndex:index];
}

-(void)save
{
    [self.defaults setObject:[self all] forKey:@"mobs"];
}

-(void)load
{
    if ([self.defaults objectForKey:@"mobs"] != nil) {
        self.all = [self.defaults objectForKey:@"mobs"];
    }
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
