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
    
    if ([self createUser]) {
        [self dismiss];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An error occurred when registering for MobSync" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(BOOL)createUser
{
    User *user = [User sharedInstance];
    user.name = self.nameTextField.text;
    return [user create];
}

-(void)dismiss
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
