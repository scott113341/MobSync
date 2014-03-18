//
//  Mob.h
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mob : NSObject

-(id)initWithServerData:(NSData *)data;
-(id)initWithDictionary:(NSDictionary *)dictionary;

@property NSInteger id;
@property (strong) NSString *name;
@property NSInteger status;
@property (strong) NSString *date;
@property (strong) NSMutableArray *usernameArray;
@property (strong) NSMutableArray *groupArray;
@property (strong) NSString *people;

-(UIColor *)statusColor;

@end
