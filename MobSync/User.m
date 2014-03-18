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
    NSString *body = [NSString stringWithFormat:@"username=%@&password=%@&name=%@&device_id=%@", self.username, self.password, self.name, self.device_id];
    
    NSData *responseData = [MobSyncServer requestURI:uri HTTPMethod:method HTTPBody:body];
    NSDictionary *response = [MobSyncServer convertDataToJSON:responseData];
    
    if ([response objectForKey:@"id"]) {
        self.id = [[response objectForKey:@"id"] intValue];
        self.name = [response objectForKey:@"name"];
        
        [UserStorage setActiveUserWithUsername:self.username];
        
        return YES;
    }
    else {
        return NO;
    }
}

-(BOOL)logIn
{
    NSString *uri = @"/login";
    NSString *method = @"POST";
    NSString *body = [NSString stringWithFormat:@"username=%@&password=%@", self.username, self.password];
    
    NSData *responseData = [MobSyncServer requestURI:uri HTTPMethod:method HTTPBody:body];
    NSDictionary *response = [MobSyncServer convertDataToJSON:responseData];
    
    if ([response objectForKey:@"id"]) {
        self.id = [[response objectForKey:@"id"] intValue];
        self.name = [response objectForKey:@"name"];
        
        [UserStorage setActiveUserWithUsername:self.username];
        
        return YES;
    }
    else {
        return NO;
    }
}



#pragma mark - NSCoding
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.id = [aDecoder decodeIntegerForKey:@"id"];
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.id forKey:@"id"];
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

@end
