//
//  MobSyncServer.h
//  MobSync
//
//  Created by Scott Hardy on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MobSyncServer : NSObject

+(NSData *)requestURI:(NSString *)uri HTTPMethod:(NSString *)method HTTPBody:(NSString*)body;
+(NSDictionary *)convertDataToJSON:(NSData *)data;

@end
