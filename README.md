#DXUIKit - 111Minutes' UI Library

available at 111minutes podspecs - https://github.com/111minutes/111-pod-specs

###Installation:

	pod repo add 111minutes https://github.com/111minutes/111-pod-specs

Then in your Podfile add this line: 

	pod 'DXUIKit'

##Examples

###Block actions

####Buttons

	UIButton *button = [UIButton new];

	[button addAction:^{

	        button.textLabel.text = @"UIControlEventTouchDown";

	}
	 forControlEvents:UIControlEventTouchDown];
    
	[button addAction:^{

	     button.textLabel.text = @"UIControlEventTouchUpInside";

	}
	 forControlEvents:UIControlEventTouchUpInside];
	 
####AlertViews

	DXActionButtonItem *cancelItem = [DXActionButtonItem buttonItemWithTitle:@"Continue"
	                                                                              action:nil];
            
	DXActionButtonItem *deleteItem = [DXActionButtonItem buttonItemWithTitle:@"Delete"
	                                                                  action:^{
	                                                                      [self updateHUDControls];
	                                                                      [[VideoRecorder shared] stopRecordingWithoutSaving];
	                                                                      NSLog(@"deleted short video");
	                                                                  }];
            
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Recorded video is too short"
	        											message:@"Recorded video duration is less than 10 sec. Delete video or continue recording?"
   	                                           cancelButtonItem:cancelItem
	                                           otherButtonItems:deleteItem, nil];
											   
	[alertView show];
	
	
###Etc.