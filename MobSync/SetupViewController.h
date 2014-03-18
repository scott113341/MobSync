//
//  SetupViewController.h
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface SetupViewController : UITableViewController

@property (weak) IBOutlet UITextField *usernameTextField;
@property (weak) IBOutlet UITextField *passwordTextField;
@property (weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITableViewCell *logInCell;
@property (nonatomic, weak) IBOutlet UITableViewCell *signUpCell;

@property (weak) NSUserDefaults *defaults;

-(void)logIn;
-(void)signUp;
-(void)dismiss;

@end
