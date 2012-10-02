//
//  DXBlockActionsDetailedViewController.m
//  DXUIKit
//
//  Created by Max Mashkov on 10/2/12.
//  Copyright (c) 2012 111minutes. All rights reserved.
//

#import "DXBlockActionsDetailedViewController.h"

@interface DXBlockActionsDetailedViewController ()

@end

@implementation DXBlockActionsDetailedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addBlockActionsToControls];
}

- (void)addBlockActionsToControls
{
    [self.clickAcionButton addAction:^{

        _clickAcionLabel.text = @"UIControlEventTouchDown";

    }
                    forControlEvents:UIControlEventTouchDown];
    
    [self.clickAcionButton addAction:^{
        
        _clickAcionLabel.text = @"UIControlEventTouchUpInside";
        
    }
                    forControlEvents:UIControlEventTouchUpInside];
}

@end
