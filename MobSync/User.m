//
//  User.m
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "User.h"
#import "UserStorage.h"

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
    NSString *bodyData = [NSString stringWithFormat:@"name=%@&device_id=%@", self.name, self.device_id];
    
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://75846f47.ngrok.com/users.json"]];
    [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setHTTPBody:[NSData dataWithBytes:[bodyData UTF8String] length:strlen([bodyData UTF8String])]];
    
    NSURLResponse *requestResponse;
    NSError *requestError;
    
    NSData *response = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&requestResponse error:&requestError];
    
    NSLog(@"%@", [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
    
    if (response == nil) return NO;
    else {
        [UserStorage createInitialStorageDefaultsWithUsername:self.name];
        NSLog(@"created user %@", [UserStorage retrieveActiveUser]);
        return YES;
    }
}

@end
