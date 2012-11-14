//
//  NSTimerDemoViewController.h
//  NSTimerDemo
//
//  Created by Uppal'z on 24/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CloseButton;
@class TweetButton;
@interface NSTimerDemoViewController : UIViewController {
    UILabel *timerLabel;
    NSTimer *pollingTimer;
    NSDateFormatter *dateFormatter;
    CloseButton *closeBtn;
    
    IBOutlet TweetButton *tweetBtn;

}

@property (nonatomic, retain) IBOutlet UILabel *timerLabel;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic,retain)IBOutlet CloseButton *closeBtn;
@property (nonatomic,retain) TweetButton *tweetBtn;
@property (nonatomic,retain) NSString *imageString;
@property (nonatomic,retain) NSString *urlString;

- (IBAction)hideClock:(id)sender;
- (IBAction)tweetTapped:(id)sender;

@end
