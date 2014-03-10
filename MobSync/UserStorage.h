//
//  UserStorage.h
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserStorage : NSObject

+(BOOL)createInitialStorageDefaultsWithUsername:(NSString*)username;
+(NSArray*)retrieveFriendList;
+(NSArray*)addFriendWithUsername:(NSString*)username;
+(NSString*)retrieveActiveUser;
+(NSString*)setActiveUserWithUsername:(NSString*)username;
+(void)destroyStorageDefaults;

@end
