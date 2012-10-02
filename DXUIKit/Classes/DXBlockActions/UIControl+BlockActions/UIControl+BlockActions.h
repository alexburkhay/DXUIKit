//
//  UIControl+BlockActions.h
//  DXUIKit
//
//  Created by Max Mashkov on 9/22/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import "DXBlockActionHandler.h"

@interface UIControl (BlockActions)

- (void)addAction:(ActionBlock)anActionBlock forControlEvents:(UIControlEvents)aControlEvents;

@end
