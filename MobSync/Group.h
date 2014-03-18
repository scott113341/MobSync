//
//  Group.h
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (strong) NSString *name;
@property (strong) NSMutableArray *membersList;

- (id)initWithName:(NSString*)name
    AndMembersList:(NSArray*)membersList;

@end
