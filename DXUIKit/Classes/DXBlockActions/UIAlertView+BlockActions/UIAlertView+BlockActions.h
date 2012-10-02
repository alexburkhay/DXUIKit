//
//  UIAlertView+BlockActions.h
//  DXUIKit
//
//  Created by Max Mashkov on 9/22/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import "DXActionButtonItem.h"

@interface UIAlertView (BlockActions)

-(id)initWithTitle:(NSString *)aTitle
           message:(NSString *)aMessage
  cancelButtonItem:(DXActionButtonItem *)cancelButtonItem
  otherButtonItems:(DXActionButtonItem *)otherButtonItems, ... NS_REQUIRES_NIL_TERMINATION;

- (void)addButtonItem:(DXActionButtonItem *)item;

@end
