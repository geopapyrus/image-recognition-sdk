//
//  sdk_exampleViewController.m
//  sdk-example
//
//  Created by Marco on 8/17/13.
//  Copyright 2013 GeoPapyrus. All rights reserved.
//

#import "sdk_exampleViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation sdk_exampleViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)launchCamera:(id)sender
{
	MyAVController *widgetController = [[MyAVController alloc] initWithDelegate:self];
	
	NSString *bundlePath = [[NSBundle mainBundle] resourcePath];
	NSLog(@"path %@",bundlePath);
	
	widgetController.db_prefix = [NSString stringWithFormat:@"%@/annual2012",bundlePath ];
	widgetController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
		
	[self presentModalViewController:widgetController animated:YES];
	
	UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
	btnTwo.frame = CGRectMake(0, 0, 240, 30);
	[btnTwo setTitle:@"blabla" forState:UIControlStateNormal];
	[btnTwo addTarget:self 
			   action:@selector(finishedWithCamera:)
	 forControlEvents:UIControlEventTouchUpInside];	
	[widgetController.view addSubview:btnTwo];
	
	[widgetController release];
}

- (void)myavController:(MyAVController*)controller didScanResult:(NSString *)result
{
	printf("Image Identified\n");
	
	NSString* outputs = [NSString stringWithFormat:@"ID: %@", [result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSLog(@"%@", outputs);	

	// Issue vibrate
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	
	// Also issue visual alert
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Image Identified!"
													message:outputs
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];	
}

- (IBAction)finishedWithCamera:(id)sender
{	
	[self  dismissModalViewControllerAnimated:YES];
}

@end
