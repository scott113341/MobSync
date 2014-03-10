//
//  MobSyncViewController.m
//  MobSync
//
//  Created by Scott Hardy on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "MobSyncViewController.h"
#import "MobSyncServer.h"

@interface MobSyncViewController ()

@end

@implementation MobSyncViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mobs = [Mobs sharedInstance];
    
    // get mob data from server
    NSString *uri = [NSString stringWithFormat:@"/mobs/%@.json", [self.notificationData objectForKey:@"mob_id"]];
    NSString *method = @"GET";
    NSString *body = @"";
    NSData *mob = [MobSyncServer requestURI:uri HTTPMethod:method HTTPBody:body];
    
    // create new local mob model
    [self.mobs.all addObject:[[Mob alloc] initWithServerData:mob]];
}

-(void)didPressDoneButton:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
