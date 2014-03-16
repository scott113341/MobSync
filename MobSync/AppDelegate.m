//
//  AppDelegate.m
//  MobSync
//
//  Created by Scott Hardy on 2/24/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "AppDelegate.h"
#import "User.h"
#import "UserStorage.h"
#import "NewMobAlertView.h"
#import "MobSyncViewController.h"
#import "Mobs.h"
#import "MobSyncServer.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert)];
    
    // set device_id to placeholder for simulator runs
    User *user = [User sharedInstance];
    user.device_id = @"nodeviceid";
    
    // uncomment to reset default user
    [UserStorage destroyStorageDefaults];
    
    return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    User *user = [User sharedInstance];
    user.device_id = [deviceToken description];
    
    NSLog(@"%@", user.device_id);
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [self processRemoteNotificationData:userInfo];
    
    NewMobAlertView *alert = [[NewMobAlertView alloc] init];
    alert.delegate = self;
    alert.message = [userInfo valueForKeyPath:@"aps.alert"];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"%li", (long)buttonIndex);
    
    NSMutableArray *allMobs = [[Mobs sharedInstance] all];
    Mob *mob = [allMobs objectAtIndex:[allMobs count]-1];
    
    if (buttonIndex == 1) {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"SplashStuff" bundle:nil];
        MobSyncViewController *mobSyncViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MobSyncViewController"];
        mobSyncViewController.mob = mob;
        [self.window.rootViewController presentViewController:mobSyncViewController animated:YES completion:nil];
    }
    else {
        mob.status = 0;
    }
}

-(Mob *)processRemoteNotificationData:(NSDictionary *)data
{
    NSLog(@"got apn: %@", data);
    self.notificationData = data;
    
    Mobs *mobs = [Mobs sharedInstance];
    
    // get mob data from server
    NSString *uri = [NSString stringWithFormat:@"/mobs/%@.json", [self.notificationData objectForKey:@"mob_id"]];
    NSData *mob = [MobSyncServer requestURI:uri HTTPMethod:@"GET" HTTPBody:@""];
    
    // create new local mob model
    Mob *newMob = [[Mob alloc] initWithServerData:mob];
    [mobs.all addObject:newMob];
    [mobs save];
    
    return newMob;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    // Notify that animations must be restarted
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RelaunchAnimations"
                                                        object:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
