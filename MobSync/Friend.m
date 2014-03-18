//
//  Friend.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Friend.h"

@implementation Friend

- (id)initWithUsername:(NSString*)username
               AndName:(NSString*)name
{
    if (self = [super init]) {
        self.username = [NSString stringWithString:username];
        self.name = [NSString stringWithString:name];
    }
    return self;
}



#pragma mark - NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

@end
