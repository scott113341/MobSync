//
//  MobSyncNavigationController.m
//  MobSync
//
//  Created by Scott Hardy on 3/6/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "MobSyncNavigationController.h"
#import "UIColor+Hex.h"

@interface MobSyncNavigationController ()

@end

@implementation MobSyncNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBarController.tabBar.tintColor = [UIColor colorWithHex:@"#e74c3c"];
    // self.navigationBar.barTintColor = [UIColor colorWithHex:@"#D6CEC3"];
    // self.navigationBar.barStyle = UIBarStyleBlack;
}

@end
