//
//  NSTimerDemoViewController.m
//  NSTimerDemo
//
//  Created by Uppal'z on 24/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NSTimerDemoViewController.h"
#import "CloseButton.h"
#import "TweetButton.h"
#import <Twitter/Twitter.h>
#import "Constants.h"

#define kPollingInterval 0.1

@interface NSTimerDemoViewController (Private)
- (void) pollTime;
@end

@implementation NSTimerDemoViewController
@synthesize timerLabel;
@synthesize dateFormatter;
@synthesize closeBtn;
@synthesize tweetBtn;
@synthesize urlString;
@synthesize imageString;

#pragma mark - Private Methods

- (void) pollTime
{
    NSDate *today = [[NSDate alloc] init];    
    NSString *currentTime = [self.dateFormatter stringFromDate: today];
    self.timerLabel.text = currentTime;
    [today release];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
   
    
    if (IS_IPAD) {
       
        self.timerLabel.font = [UIFont systemFontOfSize:150];

    }

    [tweetBtn useInitStyle];

    [super viewDidLoad];
    NSDate *today = [[NSDate alloc] init];
    dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"HH : mm : ss.S"];
    
    NSString *currentTime = [self.dateFormatter stringFromDate: today];
    self.timerLabel.text = currentTime;
    [today release];
    
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:kPollingInterval
                                                    target:self
                                                  selector:@selector(pollTime)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (IBAction)hideClock:(id)sender {
    
    if ([self respondsToSelector:@selector(presentingViewController)]) {
        // Reference UIViewController.h Line:179 for update to iOS 5 difference - @RandyMcMillan
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    } else {
        [[self parentViewController] dismissModalViewControllerAnimated:YES];
    }
 
    
    
    
}


- (IBAction)tweetTapped:(id)sender {
    
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:@"#ThatWasEZ"];
        
        if (self.imageString)
        {
            [tweetSheet addImage:[UIImage imageNamed:self.imageString]];
        }
        
        if (self.urlString)
        {
            [tweetSheet addURL:[NSURL URLWithString:self.urlString]];
        }
        
	    [self presentModalViewController:tweetSheet animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                            message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)dealloc 
{
    [timerLabel release];
    [pollingTimer invalidate];
    pollingTimer = nil;
    [dateFormatter release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setTimerLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
