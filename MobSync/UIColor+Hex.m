//
//  ActivityTableViewController.m
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+(UIColor *)colorWithHex:(NSString *)hexString
{
    int red, green, blue;
    sscanf([hexString UTF8String], "#%02X%02X%02X", &red, &green, &blue);
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

@end
