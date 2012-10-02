//
//  UIActionSheet+BlockActions.m
//  DXUIKit
//
//  Created by Max Mashkov on 9/24/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import "UIActionSheet+BlockActions.h"

@implementation UIActionSheet (BlockActions)

- (id)initWithTitle:(NSString *)title
      cancelButtonItem:(DXActionButtonItem *)cancelButtonItem
      destructiveButtonItem:(DXActionButtonItem *)destructiveItem
      otherButtonItems:(DXActionButtonItem *)otherButtonItems, ...
{
    self = [self initWithTitle:title
                 delegate:self
                 cancelButtonTitle:nil
                 destructiveButtonTitle:nil
                 otherButtonTitles:nil];
    
    if (self) {
        
        NSMutableArray *buttonsArray = [NSMutableArray array];
        
        DXActionButtonItem *eachItem;
        
        va_list argumentList;
        
        if (otherButtonItems) {
            [buttonsArray addObject: otherButtonItems];
            
            va_start(argumentList, otherButtonItems);
            while ((eachItem = va_arg(argumentList, DXActionButtonItem *))) {
                [buttonsArray addObject: eachItem];
            }
            va_end(argumentList);
        }
        
        for (DXActionButtonItem *item in buttonsArray) {
            [self addButtonWithTitle:item.title];
        }
        
        if (destructiveItem) {
            
            [buttonsArray addObject:destructiveItem];
            
            NSInteger destIndex = [self addButtonWithTitle:destructiveItem.title];
            [self setDestructiveButtonIndex:destIndex];
        }
        
        if (cancelButtonItem) {
            
            [buttonsArray addObject:cancelButtonItem];
            
            NSInteger cancelIndex = [self addButtonWithTitle:cancelButtonItem.title];
            [self setCancelButtonIndex:cancelIndex];
        }
        
        objc_setAssociatedObject(self, kBlockActionHandlersArrayKey, buttonsArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    return self;
}

- (NSInteger)addButtonItem:(DXActionButtonItem *)item
{
    NSMutableArray *buttonsArray = objc_getAssociatedObject(self, kBlockActionHandlersArrayKey);
    
	NSInteger buttonIndex = [self addButtonWithTitle:item.title];
	[buttonsArray addObject:item];
    
	return buttonIndex;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex >= 0) {
        
        NSArray *buttonsArray = objc_getAssociatedObject(self, kBlockActionHandlersArrayKey);
        
        DXActionButtonItem *item = [buttonsArray objectAtIndex:buttonIndex];
        
        [item callBlockAction];
    }
}

@end
