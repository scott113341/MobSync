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

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    // if default user already created, skip setup
    self.defaults = [NSUserDefaults standardUserDefaults];
    if ([self.defaults objectForKey:@"user"] != nil) {
        [self dismiss];
    }
}

-(void)continueButtonWasPressed:(id)sender
{
    [self.nameTextField resignFirstResponder];
    [self createUser];
    [self dismiss];
}

-(void)createUser
{
    User *user = [User sharedInstance];
    user.name = self.nameTextField.text;
    [user create];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:user.name forKey:@"user"];
    NSLog(@"user %@ created", [defaults objectForKey:@"user"]);
}

-(void)dismiss
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"MSTabBarController"];
    [self presentViewController:view animated:YES completion:nil];
}

@end
