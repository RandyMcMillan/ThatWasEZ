//
//  ViewController~iphone.m
//  AudioMeetupDemo
//
//  Created by Randy McMillan on 10/9/12.
//  Copyright (c) 2012 DOCKMARKET LLC. All rights reserved.
//

#import "ViewController~iphone.h"

@interface ViewController_iphone ()

@end

@implementation ViewController_iphone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
} /* shouldAutorotateToInterfaceOrientation */

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
currentInterfaceOrientation
{
    NSLog(@"did auto rotate");
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
