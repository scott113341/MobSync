//
//  User.m
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "User.h"
#import "UserStorage.h"
#import "MobSyncServer.h"

@implementation User

+(id)sharedInstance
{
    static User *sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[self alloc] init];
    });
    return sharedUser;
}

-(BOOL)create
{
    NSString *uri = @"/users.json";
    NSString *method = @"POST";
    NSString *body = [NSString stringWithFormat:@"name=%@&device_id=%@", self.name, self.device_id];
    
    NSData *response = [MobSyncServer requestURI:uri HTTPMethod:method HTTPBody:body];
    
    if (response == nil) return NO;
    else {
        [UserStorage createInitialStorageDefaultsWithUsername:self.name];
        NSLog(@"created user %@", [UserStorage retrieveActiveUser]);
        return YES;
    }
}

@end
