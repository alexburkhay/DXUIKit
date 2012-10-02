//
//  DXActionButtonItem.h
//  DXUIKit
//
//  Created by Max Mashkov on 9/22/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import "DXBlockActionHandler.h"

@interface DXActionButtonItem : NSObject

@property (nonatomic, strong) NSString *title;

+ (id)buttonItemWithTitle:(NSString*)aTitle action:(ActionBlock)actionBlock;
- (id)initWithTitle:(NSString*)aTitle action:(ActionBlock)actionBlock;

- (void)callBlockAction;

@end
