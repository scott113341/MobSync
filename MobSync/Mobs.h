//
//  Mobs.h
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mob.h"

@interface Mobs : NSObject

@property (strong) NSMutableArray *all;
@property (strong) NSUserDefaults *defaults;

-(Mob *)mobAtIndex:(NSInteger)index;
-(void)load;

+(id)sharedInstance;

@end
