//
//  MobSyncViewController.m
//  MobSync
//
//  Created by Scott Hardy on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "MobSyncViewController.h"
#import "MobSyncServer.h"
#import "UserStorage.h"

@interface MobSyncViewController ()

@end

@implementation MobSyncViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mobs = [Mobs sharedInstance];
    
    self.destination.text = self.mob.name;
    self.people.text = self.mob.people;
}

-(void)joinButtonWasPressed:(id)sender
{
    // get mob data from server
    NSString *uri = @"/confirm";
    NSString *body = [NSString stringWithFormat:@"username=%@&mob_id=%i", [UserStorage retrieveActiveUser], self.mob.id];
    NSData *responseData = [MobSyncServer requestURI:uri HTTPMethod:@"POST" HTTPBody:body];
    NSDictionary *response = [MobSyncServer convertDataToJSON:responseData];
    
    if ([response objectForKey:@"id"]) {
        self.mob.status = 1;
    }
    [self.mobs load];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)declineButtonWasPressed:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
