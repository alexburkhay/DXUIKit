//
//  UIActionSheet+BlockActions.h
//  DXUIKit
//
//  Created by Max Mashkov on 9/24/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import "DXActionButtonItem.h"

@interface UIActionSheet (BlockActions) <UIActionSheetDelegate>

-(id)initWithTitle:(NSString *)title
     cancelButtonItem:(DXActionButtonItem *)cancelButtonItem
     destructiveButtonItem:(DXActionButtonItem *)destructiveItem
     otherButtonItems:(DXActionButtonItem *)otherButtonItems, ... NS_REQUIRES_NIL_TERMINATION;

- (NSInteger)addButtonItem:(DXActionButtonItem *)item;

@end
