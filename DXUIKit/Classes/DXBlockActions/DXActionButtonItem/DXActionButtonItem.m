//
//  DXActionButtonItem.m
//  DXUIKit
//
//  Created by Max Mashkov on 9/22/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import "DXActionButtonItem.h"

@interface DXActionButtonItem ()

@property (nonatomic, strong) DXBlockActionHandler *actionHandler;

@end

@implementation DXActionButtonItem

+ (id)buttonItemWithTitle:(NSString *)aTitle
                   action:(ActionBlock)actionBlock
{
    return [[DXActionButtonItem alloc] initWithTitle:aTitle
                                              action:actionBlock];
}

- (id)initWithTitle:(NSString *)aTitle
             action:(ActionBlock)actionBlock
{
    self = [super init];
    if (self) {
        self.title = aTitle;
        self.actionHandler = [DXBlockActionHandler blockHandlerWithBlock:actionBlock];
    }
    return self;
}

- (void)callBlockAction
{
    [self.actionHandler callBlockAction:nil];
}

@end
