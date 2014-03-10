//
//  FriendCreationViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/10/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "FriendCreationViewController.h"

@interface FriendCreationViewController ()

@end

@implementation FriendCreationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)cancelButtonWasPressed:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
