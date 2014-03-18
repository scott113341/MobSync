//
//  Friend.h
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject <NSCoding>

@property (strong) NSString *username;
@property (strong) NSString *name;

- (id)initWithUsername:(NSString*)username
               AndName:(NSString*)name;

@end
