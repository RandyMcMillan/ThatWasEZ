//
//  AudioMeetupDemoAppDelegate.h
//  AudioMeetupDemo
//
//  Created by Barry Ezell on 5/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController~ipad.h"
#import "ViewController~iphone.h"

@interface AudioMeetupDemoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ViewController_ipad *viewControllerIPad;
@property (nonatomic, retain) IBOutlet ViewController_iphone *viewControllerIPhone;
@end
