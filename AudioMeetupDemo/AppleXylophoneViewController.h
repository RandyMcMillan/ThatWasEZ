//
//  AppleXylophone.h
//  AudioMeetupDemo
//
//  Created by Barry Ezell on 6/13/11.
//  Copyright 2011 DOCKMARKET LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixerHostAudio.h"
@class TweetButton;
@class ShowClockBtn;
#define KEY_COUNT 6

@interface AppleXylophoneViewController : UIViewController {
    int                 lastKeyIndex;
    CGRect              keyRects[KEY_COUNT];
    
    IBOutlet UILabel *label0;
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    IBOutlet UILabel *label4;
    IBOutlet UILabel *label5;
    
    IBOutlet UIImageView *imageView;
    IBOutlet TweetButton *tweetBtn;
    IBOutlet ShowClockBtn *showClockBtn;
    
}

@property (nonatomic, assign) MixerHostAudio *mixerHost;

@property (nonatomic,retain) NSString *imageString;
@property (nonatomic,retain) NSString *urlString;
@property (nonatomic,retain) TweetButton *tweetBtn;
@property (nonatomic,retain) ShowClockBtn *showClockBtn;

- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction) mixerOutputGainChanged: (UISlider *) sender;
- (void)drawRects;
- (IBAction)tweetTapped:(id)sender;
- (IBAction)showClock:(id)sender;

@end
