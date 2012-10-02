//
//  DXBlockActionHandler.h
//  DXUIKit
//
//  Created by Max Mashkov on 9/22/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef void (^ActionBlock)();

extern const char *kBlockActionHandlersArrayKey;

@interface DXBlockActionHandler : NSObject

@property (nonatomic, copy, readonly) ActionBlock actionBlock;

+ (id)blockHandlerWithBlock:(ActionBlock)anActionBlock;

- (id)initWithBlock:(ActionBlock)anActionBlock;

- (void)callBlockAction:(id)sender;

@end
