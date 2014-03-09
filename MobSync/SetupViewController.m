//
//  SetupViewController.m
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "SetupViewController.h"
#import "User.h"

@interface SetupViewController ()

@end

@implementation SetupViewController

-(void)continueButtonWasPressed:(id)sender
{
    [self.nameTextField resignFirstResponder];
    
    NSLog(@"asdf");
    
    [self createUser];
}

-(void)createUser
{
    User *user = [User sharedInstance];
    user.name = self.nameTextField.text;
    [user create];
}

@end
