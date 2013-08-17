//
//  sdk_exampleViewController.h
//  sdk-example
//
//  Created by Marco on 8/17/13.
//  Copyright 2013 GeoPapyrus. All rights reserved.
//

#include "MyAVController.h"
#import <UIKit/UIKit.h>

@interface sdk_exampleViewController : UIViewController <MyAVDelegate>

- (IBAction)launchCamera:(id)sender;

@end

