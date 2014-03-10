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
}

-(void)didPressDoneButton:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
