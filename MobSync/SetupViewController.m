//
//  SetupViewController.m
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "SetupViewController.h"
#import "User2.h"
#import "User.h"

@interface SetupViewController ()

@end

@implementation SetupViewController

-(void)logIn
{
    NSLog(@"login");
    
    User *user = [User sharedInstance];
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextField.text;
    
    if ([user logIn]) {
        [self dismiss];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An error occurred when logging in to MobSync" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)signUp
{
    NSLog(@"signup");
    
    User *user = [User sharedInstance];
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextField.text;
    user.name = self.nameTextField.text;
    
    if ([user create]) {
        [self dismiss];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An error occurred when signing up for MobSync" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.tableView cellForRowAtIndexPath:indexPath] == self.logInCell) {
        [self logIn];
    }
    else {
        [self signUp];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)dismiss
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
