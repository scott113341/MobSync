//
//  Mob.m
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Mob.h"
#import "UIColor+Hex.h"
#import "MobSyncServer.h"

@implementation Mob

-(id)init
{
    if (self = [super init]) {
        self.name = [[NSString alloc] init];
        self.status = 0;
        self.date = @"3/10/2014";
        self.usernameArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id)initWithServerData:(NSData *)data
{
    if (self = [super init]) {
        NSDictionary *mob = [MobSyncServer convertDataToJSON:data];
        
        self.name = [mob objectForKey:@"destination"];
        self.status = 1;
        self.date = [mob objectForKey:@"date"];
    }
    return self;
}

-(UIColor *)statusColor
{
    if (self.status == 0) return [UIColor colorWithHex:@"#E82323"];
    else return [UIColor colorWithHex:@"#00B346"];
}

@end
