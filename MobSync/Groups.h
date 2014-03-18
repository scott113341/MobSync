//
//  Groups.h
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"

@interface Groups : NSObject <UITableViewDataSource>

@property (strong) NSMutableArray *groups;

- (id)initFromStorage;
- (Group*)groupAtIndex:(int)index;
- (void)addGroup:(Group*)group;
- (int)count;
-(NSArray *)usernamesInGroupName:(NSString *)groupName;

+ (id)sharedInstance;

@end
