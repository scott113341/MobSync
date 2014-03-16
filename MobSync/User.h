//
//  User.h
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSInteger id;
@property (strong) NSString *username;
@property (strong) NSString *name;
@property (strong) NSString *device_id;

+(id)sharedInstance;

-(BOOL)create;

@end
