//
//  AppDelegate.h
//  MobSync
//
//  Created by Scott Hardy on 2/24/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mob.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong) NSDictionary *notificationData;

-(Mob *)processRemoteNotificationData:(NSDictionary *)data;

@end
