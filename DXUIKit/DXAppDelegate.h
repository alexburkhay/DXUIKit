//
//  DXAppDelegate.h
//  DXUIKit
//
//  Created by Max Mashkov on 10/1/12.
//  Copyright (c) 2012 111minutes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DXViewController;

@interface DXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DXViewController *viewController;

@end
