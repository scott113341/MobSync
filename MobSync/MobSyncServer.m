//
//  MobSyncServer.m
//  MobSync
//
//  Created by Scott Hardy on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "MobSyncServer.h"

@implementation MobSyncServer

+(NSData *)requestURI:(NSString *)uri HTTPMethod:(NSString *)method HTTPBody:(NSString *)body
{
    NSString *url = [NSString stringWithFormat:@"http://75846f47.ngrok.com%@", uri];
    
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [postRequest setHTTPMethod:method];
    [postRequest setHTTPBody:[NSData dataWithBytes:[body UTF8String] length:strlen([body UTF8String])]];
    
    NSURLResponse *requestResponse;
    NSError *requestError;
    
    NSData *response = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&requestResponse error:&requestError];
    
    NSLog(@"%@", [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
    
    return response;
}

@end
