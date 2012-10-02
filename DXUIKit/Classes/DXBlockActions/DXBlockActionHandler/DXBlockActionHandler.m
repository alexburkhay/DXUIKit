//
//  DXBlockActionHandler.m
//  DXUIKit
//
//  Created by Max Mashkov on 9/22/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import "DXBlockActionHandler.h"

const char *kBlockActionHandlersArrayKey = "kBlockActionHandlersArrayKey";

@interface DXBlockActionHandler ()

@property (nonatomic, copy) ActionBlock actionBlock;

@end

@implementation DXBlockActionHandler

+ (id)blockHandlerWithBlock:(ActionBlock)anActionBlock
{
    return [[self alloc] initWithBlock:anActionBlock];
}

- (id)initWithBlock:(ActionBlock)anActionBlock
{
    self = [super init];
    if (self) {
        self.actionBlock = anActionBlock;
    }
    return self;
}

- (void)callBlockAction:(id)sender
{
    if (_actionBlock) {
        _actionBlock();
    }
}

@end
