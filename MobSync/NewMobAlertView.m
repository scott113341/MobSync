//
//  NewMobAlertView.m
//  MobSync
//
//  Created by Scott Hardy on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "NewMobAlertView.h"

@implementation NewMobAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = @"New MobSync!";
        
        [self addButtonWithTitle:@"Decline"];
        [self addButtonWithTitle:@"View Details"];
    }
    return self;
}

@end
