//
//  UIGestureRecognizer+BlockActions.h
//  DXUIKit
//
//  Created by Max Mashkov on 9/24/12.
//  Copyright (c) 2012 Max Mashkov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *recognizer);

@interface UIGestureRecognizer (BlockActions)

+ (id)recognizerWithActionBlock:(GestureActionBlock)actionBlock;
- (id)initWithActionBlock:(GestureActionBlock)actionBlock;

@end
