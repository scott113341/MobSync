//
//  Mobs.m
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Mobs.h"
#import "MobSyncServer.h"
#import "UserStorage.h"

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

-(void)load
{
    // get mob data from server
    NSString *uri = @"/mymobs";
    NSString *body = [NSString stringWithFormat:@"username=%@", [UserStorage retrieveActiveUser]];
    NSData *responseData = [MobSyncServer requestURI:uri HTTPMethod:@"POST" HTTPBody:body];
    NSDictionary *response = [MobSyncServer convertDataToJSON:responseData];
    
    NSLog(@"%@", response);
    
    if ([response count] > 0) {
        [self.all removeAllObjects];
        [response enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"%@", obj);
            Mob *newMob = [[Mob alloc] initWithDictionary:obj];
            [self.all addObject:newMob];
        }];
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
