//
//  MobCreationViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/1/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "MobCreationViewController.h"
#import "ChooseFriendsViewController.h"
#import "MobSyncServer.h"
#import "Mobs.h"

@interface MobCreationViewController ()

@end

@implementation MobCreationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mob = [[Mob alloc] init];
}

-(void)didSelectPickFriends:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    ChooseFriendsViewController *chooseFriendsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ChooseFriendsViewController"];
    
    chooseFriendsViewController.mob = self.mob;
    
    [self.navigationController pushViewController:chooseFriendsViewController animated:YES];
}

-(void)didSelectDone:(id)sender
{
    // get mob data from server
    NSString *uri = @"/mobs.json";
    NSString *body = [NSString stringWithFormat:@"user_id=3&user_idz=3,1,2&destination=%@", self.destination.text];
    NSData *mob = [MobSyncServer requestURI:uri HTTPMethod:@"POST" HTTPBody:body];
    
    // create new local mob model
    Mobs *mobs = [Mobs sharedInstance];
    [mobs.all addObject:self.mob];
}

-(void)hideKeyboard:(id)sender
{
    [self.destination resignFirstResponder];
}

@end
