//
//  UserStorage.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "UserStorage.h"

@implementation UserStorage

- (BOOL)createInitialStorageDefaultsWithUsername:(NSString*)username
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:[NSArray array] forKey:@"friends"];
    [standardUserDefaults setObject:username forKey:@"user"];
    return YES;
}

- (NSArray*)retrieveFriendList
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults arrayForKey:@"friends"];
}

- (NSArray*)addFriendWithUsername:(NSString*)username
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *friends = [NSMutableArray arrayWithArray:[self retrieveFriendList]];
    [friends addObject:username];
    [standardUserDefaults setObject:[NSArray arrayWithArray:friends] forKey:@"friends"];
    return [NSArray arrayWithArray:friends];
}

- (NSString*)retrieveActiveUser
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults stringForKey:@"user"];
}

- (NSString*)setActiveUserWithUsername:(NSString*)username
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:username forKey:@"user"];
    return username;
}

@end
