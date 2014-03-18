//
//  UserStorage.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "UserStorage.h"

@implementation UserStorage

+ (BOOL)createInitialStorageDefaultsWithUsername:(NSString*)username
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    //[standardUserDefaults setObject:[Friends init] forKey:@"friends"];
    //[standardUserDefaults setObject:[Groups init] forKey:@"groups"];
    [standardUserDefaults setObject:username forKey:@"user"];
    return YES;
}

+ (Friends*)retrieveFriends
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults objectForKey:@"friends"];
}

+ (void)commitFriends:(Friends*)friends
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:friends forKey:@"friends"];
}

+ (Groups*)retrieveGroups
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults objectForKey:@"groups"];
}
+ (void)commitGroups:(Groups *)groups
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:groups forKey:@"groups"];
}

+ (NSString*)retrieveActiveUser
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults stringForKey:@"user"];
}

+ (NSString*)setActiveUserWithUsername:(NSString*)username
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:username forKey:@"user"];
    return username;
}

+ (void)destroyStorageDefaults
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults removeObjectForKey:@"user"];
    [standardUserDefaults removeObjectForKey:@"friends"];
    [standardUserDefaults removeObjectForKey:@"groups"];
}

@end
