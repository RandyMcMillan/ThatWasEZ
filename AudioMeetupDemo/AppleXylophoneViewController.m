//
//  AppleXylophone.m
//  AudioMeetupDemo
//
//  Created by Barry Ezell on 6/13/11.
//  Copyright 2011 DOCKMARKET LLC. All rights reserved.
//

#import "AppleXylophoneViewController.h"
#import "UIImage+PDF.h"
#import <Twitter/Twitter.h>
#import "TweetButton.h"
#import "ShowClockBtn.h"
#import "NSTimerDemoViewController.h"

@interface AppleXylophoneViewController ()
// @property (strong, nonatomic) NSString *imageString;
// @property (strong, nonatomic) NSString *urlString;
@end

@implementation AppleXylophoneViewController

@synthesize mixerHost;
@synthesize urlString;
@synthesize imageString;
@synthesize tweetBtn;
@synthesize showClockBtn;

- (void)dealloc
{
	[super dealloc];
	[mixerHost release];
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {}

- (void)viewDidLoad
{
	[super viewDidLoad];

	[tweetBtn useInitStyle];
	[showClockBtn useInitStyle];

	UIImageView *buttonImageView = [[UIImageView alloc] initWithImage:[UIImage originalSizeImageWithPDFNamed:@"ThatWasEZ.pdf"]];
	// buttonImageView.center = self.view.center;
	// [ self.view addSubview:imageView ];
	// [ buttonImageView release ];

	imageView.image = buttonImageView.image;
	[buttonImageView release];

	// [self drawRects];

	// define the "key" xylophone note rectangles

	/*
	 *   keyRects[0] = label0.frame;//CGRectMake(55, 347, 199, 42);
	 *   keyRects[1] = label1.frame;//CGRectMake(55, 304, 199, 42);
	 *   keyRects[2] = label2.frame;//CGRectMake(55, 258, 199, 44);
	 *   keyRects[3] = label3.frame;//CGRectMake(55, 213, 199, 44);
	 *   keyRects[4] = label4.frame;//CGRectMake(55, 166, 199, 44);
	 *   keyRects[5] = label5.frame;//CGRectMake(55, 43, 199, 121);
	 */

	// create the mixer
	self.mixerHost = [[MixerHostAudio alloc] init];

	// start the audio graph
	[mixerHost startAUGraph];
}

- (void)drawRects
{
	// define the "key" xylophone note rectangles
	keyRects[0] = imageView.frame;	// label0.frame;//CGRectMake(55, 347, 199, 42);
	keyRects[1] = label1.frame;		// CGRectMake(55, 304, 199, 42);
	// keyRects[2] = label2.frame;//CGRectMake(55, 258, 199, 44);
	// keyRects[3] = label3.frame;//CGRectMake(55, 213, 199, 44);
	// keyRects[4] = label4.frame;//CGRectMake(55, 166, 199, 44);
	// keyRects[5] = label5.frame;//CGRectMake(55, 43, 199, 121);
}

- (IBAction)tweetTapped:(id)sender
{
	if ([TWTweetComposeViewController canSendTweet]) {
		TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
		[tweetSheet setInitialText:@"#ThatWasEZ"];

		if (self.imageString) {
			[tweetSheet addImage:[UIImage imageNamed:self.imageString]];
		}

		if (self.urlString) {
			[tweetSheet addURL:[NSURL URLWithString:self.urlString]];
		}

		[self presentModalViewController:tweetSheet animated:YES];
	} else {
		UIAlertView *alertView = [[UIAlertView alloc]	initWithTitle		:@"Sorry"
														message				:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
														delegate			:self
														cancelButtonTitle	:@"OK"
														otherButtonTitles	:nil];
		[alertView show];
	}
}

- (IBAction)showClock:(id)sender
{
	NSTimerDemoViewController *clockVC = [NSTimerDemoViewController alloc];

	clockVC.modalTransitionStyle	= (UIModalTransitionStyleCrossDissolve);
	clockVC.modalPresentationStyle	= (UIModalPresentationFullScreen);
	[self presentViewController:clockVC animated:YES completion:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   toInterfaceOrientation
{
	// Return YES for supported orientations
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		return YES;
	}

	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		return YES;
	}

	if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
		return YES;
	}

	if (toInterfaceOrientation ==
		UIInterfaceOrientationPortraitUpsideDown) {
		return YES;
	} else {return NO; }
}	/* shouldAutorotateToInterfaceOrientation */

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   currentInterfaceOrientation
{
	NSLog(@"did auto rotate");
	return YES;
}

- (void)viewDidUnload
{
	self.view = nil;
	// [super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

// Handle a change in the mixer output gain slider.
- (IBAction)mixerOutputGainChanged:(UISlider *)sender
{
	[mixerHost setMixerOutputGain:(AudioUnitParameterValue)sender.value];
}

#pragma mark -
#pragma mark Touch events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self drawRects];

	UITouch *aTouch = [touches anyObject];
	int		idx		= [self keyIndexForTouch:aTouch];

	if (idx >= 0) {
		if ([mixerHost playNote:idx] == YES) {
			lastKeyIndex = idx;
		}
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	lastKeyIndex = -1;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *aTouch = [touches anyObject];
	int		idx		= [self keyIndexForTouch:aTouch];

	if ((idx >= 0) && (idx != lastKeyIndex)) {
		if ([mixerHost playNote:idx] == YES) {
			lastKeyIndex = idx;
		}
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	lastKeyIndex = -1;
}

- (int)keyIndexForTouch:(UITouch *)touch
{
	int		keyIndex	= -1;
	CGPoint pt			= [touch locationInView:self.view];

	for (int i = 0; i < KEY_COUNT; i++) {
		CGRect rect = keyRects[i];

		if (CGRectContainsPoint(rect, pt)) {
			keyIndex = i;
			break;
		}
	}

	return keyIndex;
}

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];

	// Release any cached data, images, etc that aren't in use.
}

@end
