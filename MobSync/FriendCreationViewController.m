//
//  FriendCreationViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/10/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "FriendCreationViewController.h"
#import "MobSyncServer.h"
#import "Friend.h"
#import "Friends.h"

@interface FriendCreationViewController ()

@end

@implementation FriendCreationViewController

-(void)addBUttonWasPressed:(id)sender
{
    NSString *uri = @"/usersearch";
    NSString *body = [NSString stringWithFormat:@"username=%@", self.username.text];
    NSData *responseData = [MobSyncServer requestURI:uri HTTPMethod:@"POST" HTTPBody:body];
    NSDictionary *response = [MobSyncServer convertDataToJSON:responseData];
    
    if ([response objectForKey:@"id"]) {
        Friend *newFriend = [[Friend alloc] initWithUsername:self.username.text AndName:[response objectForKey:@"name"]];
        [[Friends sharedInstance] addFriend:newFriend];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"A MobSync user with that username does not exist" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)cancelButtonWasPressed:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
