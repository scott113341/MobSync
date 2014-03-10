//
//  Mob.h
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mob : NSObject

-(id)initMobWithName:(NSString *)name andStatus:(NSInteger)status;

-(id)initWithServerData:(NSData *)data;

@property (strong) NSString *name;
@property NSInteger status;
@property (strong) NSString *date;

-(UIColor *)statusColor;

@end
