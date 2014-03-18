//
//  Friends.h
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

@interface Friends : NSObject <UITableViewDataSource, NSCoding>

@property (strong) NSMutableArray *friends;

- (void)addFriend:(Friend*)friend;
- (Friend*)friendAtIndex:(int)index;

+ (id)sharedInstance;

@end
