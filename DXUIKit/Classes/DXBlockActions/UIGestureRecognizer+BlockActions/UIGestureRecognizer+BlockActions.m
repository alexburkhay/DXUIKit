//
//  UIGestureRecognizer+BlockActions.m
//  DXUIKit
//
//  Created by Max Mashkov on 9/24/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import <objc/runtime.h>
#import "UIGestureRecognizer+BlockActions.h"

const char *kGestureActionBlockKey = "kGestureActionBlockKey";

@interface UIGestureRecognizer (Private)

- (void)gestureStateChanged:(UIGestureRecognizer*)gestureRecognizer;

@end

@implementation UIGestureRecognizer (BlockActions)

+ (id)recognizerWithActionBlock:(GestureActionBlock)actionBlock
{
    return [[self alloc] initWithActionBlock:actionBlock];
}

- (id)initWithActionBlock:(GestureActionBlock)actionBlock
{
    self = [self initWithTarget:self action:@selector(gestureStateChanged:)];
    if (self) {
        objc_setAssociatedObject(self, kGestureActionBlockKey, actionBlock, OBJC_ASSOCIATION_COPY);
    }
    return self;
}

- (void)gestureStateChanged:(UIGestureRecognizer *)gestureRecognizer
{
    GestureActionBlock actionBlock = objc_getAssociatedObject(self, kGestureActionBlockKey);
    
    if (actionBlock) {
        actionBlock(self);
    }
}

@end
