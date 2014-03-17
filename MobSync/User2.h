//
//  Users2.h
//  MobSync
//
//  Created by Scott Hardy on 3/16/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface User2 : NSManagedObject

@property NSInteger userID;
@property (strong) NSString *username;
@property (strong) NSString *password;
@property (strong) NSString *name;
@property (strong) NSString *deviceID;

@end
