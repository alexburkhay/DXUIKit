//
//  UIControl+BlockActions.m
//  DXUIKit
//
//  Created by Max Mashkov on 9/22/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import <objc/runtime.h>
#import "UIControl+BlockActions.h"

@interface UIControl (Private)

- (NSArray*)getBlockActionHandlers;
- (void)setActionHandlers:(NSArray*)actionHandlers;

@end

@implementation UIControl (Private)

- (NSArray*)getBlockActionHandlers
{
    NSArray *actionHandlersArray = objc_getAssociatedObject(self, kBlockActionHandlersArrayKey);
    
    if (!actionHandlersArray) {
        actionHandlersArray = [NSArray new];
        objc_setAssociatedObject(self, kBlockActionHandlersArrayKey, actionHandlersArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return actionHandlersArray;
}

- (void)setActionHandlers:(NSArray *)actionHandlers
{
    objc_setAssociatedObject(self, kBlockActionHandlersArrayKey, actionHandlers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end


@implementation UIControl (BlockActions)

- (void)addAction:(ActionBlock)anActionBlock forControlEvents:(UIControlEvents)aControlEvents
{
    DXBlockActionHandler *blockHandler = [DXBlockActionHandler blockHandlerWithBlock:anActionBlock];
    
    [self addTarget:blockHandler
          action:@selector(callBlockAction:)
          forControlEvents:aControlEvents];
    
    NSArray *actionHandlers = [self getBlockActionHandlers];
    
    actionHandlers = [actionHandlers arrayByAddingObject:blockHandler];
    
    [self setActionHandlers:actionHandlers];
}


@end


