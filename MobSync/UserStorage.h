//
//  UserStorage.h
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"
#import "Groups.h"
#import "Friend.h"
#import "Friends.h"

@interface UserStorage : NSObject

+ (BOOL)createInitialStorageDefaultsWithUsername:(NSString*)username;
+ (Friends*)retrieveFriends;
+ (void)commitFriends:(Friends*)friends;
+ (Groups*)retrieveGroups;
+ (void)commitGroups:(Groups*)groups;
+ (NSString*)retrieveActiveUser;
+ (NSString*)setActiveUserWithUsername:(NSString*)username;
+ (void)destroyStorageDefaults;

@end
