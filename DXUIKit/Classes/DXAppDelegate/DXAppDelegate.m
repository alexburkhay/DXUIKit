//
//  DXAppDelegate.m
//  DXUIKit
//
//  Created by Max Mashkov on 11/10/12.
//  Copyright (c) 2012 111minutes. All rights reserved.
//

#import "DXAppDelegate.h"

@implementation DXAppDelegate

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    [[NSNotificationCenter defaultCenter] postNotificationName:DXUIKitNotificationNames.handleOpenUrl
                                                        object:nil
                                                      userInfo:@{DXUIKitNotificationKeys.handleOpenUrl : url}];
    
    return YES;
}

- (NSString*)tokenByReplacingAngleBracketsFromDeviceToken:(NSString *)deviceToken
{
    NSString *token = deviceToken.copy;
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    
    return token;
}

@end
