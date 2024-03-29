//
//

#import "ExampleView.h"


//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
//

#define kLeftMargin                 20.0
#define kTopMargin                  20.0
#define kRightMargin                20.0
#define kTweenMargin                6.0

#define kTextFieldHeight            30.0

#define KEY_COUNT                   36

#define VIEWBOUNDS                  [[UIScreen mainScreen] bounds]

#ifndef IS_IPAD
#define IS_IPAD                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif

#define BIGBOXWIDTH                 90
#define BIGBOXHEIGHT                90
#define SMALLBOXWIDTH               50
#define SMALLBOXHEIGHT              50

#define NOTEWIDTH                   30
#define NOTEHEIGHT                  40

#define WELCOMEWIDTH                412
#define WELCOMEHEIGHT               412

#define GRANDSTAFFEXAMPLEWIDTH      703
#define GRANDSTAFFEXAMPLEHEIGHT     768

#define CIRCLEWIDTH                 725
#define CIRCLEHEIGHT                725

#ifndef kXOrientationAdjustiPad
#define kXOrientationAdjustiPad   0
#endif

#ifndef kYOrientationAdjustiPad
#define kYOrientationAdjustiPad 0
#endif

#ifndef kXOrientationAdjustiPhone
#define kXOrientationAdjustiPhone 0
#endif

#ifndef kYOrientationAdjustiPhone
#define kYOrientationAdjustiPhone 0
#endif

#define TWITTER_URL                 @ "http://api.twitter.com/1/"



@interface ExampleView ()
@property (nonatomic, readonly) CGGradientRef   normalGradient;
@property (nonatomic, readonly) CGGradientRef   highlightGradient;
- (void)hesitateUpdate; // Used to catch and fix problem where quick
                        // taps don't get updated back to normal state
@end
#pragma mark -

@implementation ExampleView
@synthesize normalGradientColors;
@synthesize normalGradientLocations;
@synthesize highlightGradientColors;
@synthesize highlightGradientLocations;
@synthesize cornerRadius;
@synthesize strokeWeight, strokeColor;
@synthesize normalGradient, highlightGradient;
#pragma mark -
- (CGGradientRef)normalGradient
{
    if (normalGradient == NULL) {
        int     locCount = [normalGradientLocations count];
        CGFloat locations[locCount];

        for (int i = 0; i < [normalGradientLocations count]; i++) {
            NSNumber *location =
                [normalGradientLocations objectAtIndex:i];
            locations[i] = [location floatValue];
        }

        CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();

        normalGradient = CGGradientCreateWithColors(
            space, ( CFArrayRef)normalGradientColors, locations);
        CGColorSpaceRelease(space);
    }

    return normalGradient;
}   /* normalGradient */

- (CGGradientRef)highlightGradient
{
    if (highlightGradient == NULL) {
        CGFloat locations[[highlightGradientLocations count]];

        for (int i = 0; i < [highlightGradientLocations count]; i++) {
            NSNumber *location =
                [highlightGradientLocations objectAtIndex:i];
            locations[i] = [location floatValue];
        }

        CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();

        highlightGradient =
            CGGradientCreateWithColors(space,
            ( CFArrayRef)highlightGradientColors,
            locations);
        CGColorSpaceRelease(space);
    }

    return highlightGradient;
}   /* highlightGradient */

#pragma mark -
- (id)initWithFrame:(CGRect)frame
{
    // self = [super initWithFrame:frame];

    if (self) {
        // [self setOpaque:NO];
        // self.backgroundColor = [UIColor clearColor];
    }

    return self;
}

#pragma mark -
#pragma mark Appearances

- (void)useWelcomeStyle
{
    CGRect rect = self.superview.frame;

    self.alpha = 1.0;
    [self setContentMode:(UIViewContentModeScaleAspectFit)];
    [self setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)];

    if (IS_IPAD) {
        
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
            
            [self setBounds:CGRectMake(0, 0, WELCOMEHEIGHT, WELCOMEWIDTH)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];
            
        } else {
            
            [self setBounds:CGRectMake(0, 0, WELCOMEHEIGHT, WELCOMEWIDTH)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];
            
        }
        
    } else {//not ipad
        
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {

            //  [self setBounds:VIEWBOUNDS];
            [self setBounds:CGRectMake(0, 0, WELCOMEHEIGHT+170, WELCOMEWIDTH+170)];
            [self setCenter:CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0)];
            //  [self setCenter:CGPointMake(0,0)];
            
        } else {
           
            //[self setBounds:VIEWBOUNDS];
            [self setBounds:CGRectMake(0, 0, WELCOMEHEIGHT+170, WELCOMEWIDTH+170)];
            [self setCenter:CGPointMake(rect.size.width / 2.0, rect.size.height / 2.1)];
            //[self setCenter:CGPointMake(0,0)];
 
        }
        
    }

}   /* useGrandStaffStyle */

- (void)useGrandStaffStyle
{
    
    
    //NSLog(@"%f",[[UIScreen mainScreen] scale]);
    CGRect rect = self.superview.frame;

    self.alpha = 1.0;
    [self setContentMode:(UIViewContentModeScaleAspectFit)];
    [self setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)];

    
    if (IS_IPAD) {

        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
        
            [self setBounds:CGRectMake(0, 0, GRANDSTAFFEXAMPLEHEIGHT, GRANDSTAFFEXAMPLEWIDTH)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];

        } else {
        
            [self setBounds:CGRectMake(0, 0, GRANDSTAFFEXAMPLEHEIGHT, GRANDSTAFFEXAMPLEWIDTH)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];

        }
    
    } else {//not ipad
   
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
            
            [self setBounds:CGRectMake(0, 0, GRANDSTAFFEXAMPLEHEIGHT, GRANDSTAFFEXAMPLEWIDTH-260)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];
 
        } else {
            
            [self setBounds:CGRectMake(0, 0, GRANDSTAFFEXAMPLEHEIGHT, GRANDSTAFFEXAMPLEWIDTH-260)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];

        }
    
    }
    
    //    [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];
}   /* useGrandStaffStyle */

- (void)useCircleStyle
{
    CGRect rect = self.superview.frame;
    
    self.alpha = 1.0;
    [self setContentMode:(UIViewContentModeScaleAspectFit)];
    [self setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth)];

    if (IS_IPAD) {
        
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
            
            [self setBounds:CGRectMake(0, 0, CIRCLEHEIGHT, CIRCLEWIDTH)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.16)];
            
        } else {
            
            [self setBounds:CGRectMake(0, 0, CIRCLEHEIGHT, CIRCLEWIDTH)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.16)];
            
        }
        
    } else {//not ipad
        
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
            
            [self setBounds:CGRectMake(0, 0, CIRCLEHEIGHT-500, CIRCLEWIDTH-260)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];
            
        } else {
            
            [self setBounds:CGRectMake(0, 0, CIRCLEHEIGHT-500, CIRCLEWIDTH-260)];
            [self setCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2.38)];
            
        }
        
    }
}   /* useGrandStaffStyle */

#pragma mark -
- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor clearColor];
    CGRect imageBounds =
        CGRectMake(0.0, 0.0, self.bounds.size.width - 0.5,
        self.bounds.size.height);

    CGGradientRef   gradient;
    CGContextRef    context = UIGraphicsGetCurrentContext();
    CGPoint         point2;

    CGFloat resolution = 0.5 *
        (self.bounds.size.width / imageBounds.size.width +
        self.bounds.size.height / imageBounds.size.height);

    CGFloat stroke = strokeWeight * resolution;

    if (stroke < 1.0) {
        stroke = ceil(stroke);
    } else {
        stroke = round(stroke);
    }

    stroke /= resolution;
    CGFloat             alignStroke = fmod(0.5 * stroke * resolution, 1.0);
    CGMutablePathRef    path        = CGPathCreateMutable();
    CGPoint             point       =
        CGPointMake((self.bounds.size.width - [self cornerRadius]),
        self.bounds.size.height - 0.5f);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathMoveToPoint(path, NULL, point.x, point.y);
    point =
        CGPointMake(self.bounds.size.width - 0.5f,
        (self.bounds.size.height - [self cornerRadius]));
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPoint controlPoint1 =
        CGPointMake((self.bounds.size.width - ([self cornerRadius] / 2.f)),
        self.bounds.size.height - 0.5f);
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    CGPoint controlPoint2 =
        CGPointMake(self.bounds.size.width - 0.5f,
        (self.bounds.size.height - ([self cornerRadius] / 2.f)));
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point = CGPointMake(self.bounds.size.width - 0.5f,
        [self cornerRadius]);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    point = CGPointMake((self.bounds.size.width - [self cornerRadius]),
        0.0);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint1 =
        CGPointMake(self.bounds.size.width - 0.5f,
        ([self cornerRadius] / 2.f));
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint2 =
        CGPointMake((self.bounds.size.width - ([self cornerRadius] / 2.f)),
        0.0);
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point   = CGPointMake([self cornerRadius], 0.0);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    point   = CGPointMake(0.0, [self cornerRadius]);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint1   = CGPointMake(([self cornerRadius] / 2.f), 0.0);
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint2   = CGPointMake(0.0, ([self cornerRadius] / 2.f));
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point =
        CGPointMake(0.0, (self.bounds.size.height - [self cornerRadius]));
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    point = CGPointMake([self cornerRadius],
        self.bounds.size.height - 0.5f);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint1 =
        CGPointMake(0.0,
        (self.bounds.size.height - ([self cornerRadius] / 2.f)));
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint2 = CGPointMake(([self cornerRadius] / 2.f),
        self.bounds.size.height - 0.5f);
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point = CGPointMake((self.bounds.size.width - [self cornerRadius]),
        self.bounds.size.height - 0.5f);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    CGPathCloseSubpath(path);

    /*
     *   if (self.state == UIControlStateHighlighted) {
     *    gradient = self.highlightGradient;
     *   } else {
     *
     */
    gradient = self.normalGradient;

    /*}
     *
     */

    CGContextAddPath(context, path);
    CGContextSaveGState(context);
    CGContextEOClip(context);
    point = CGPointMake((self.bounds.size.width / 2.0),
        self.bounds.size.height - 0.5f);
    point2 = CGPointMake((self.bounds.size.width / 2.0), 0.0);
    CGContextDrawLinearGradient(context, gradient, point, point2,
        (kCGGradientDrawsBeforeStartLocation |
            kCGGradientDrawsAfterEndLocation));
    CGContextRestoreGState(context);
    [strokeColor setStroke];
    CGContextSetLineWidth(context, stroke);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    CGPathRelease(path);
}   /* drawRect */

#pragma mark -
#pragma mark Touch Handling
- (void)hesitateUpdate
{
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self setNeedsDisplay];
    [self   performSelector :@selector(hesitateUpdate) withObject:nil
            afterDelay      :0.1];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self setNeedsDisplay];
    [self   performSelector :@selector(hesitateUpdate) withObject:nil
            afterDelay      :0.1];
}

#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:[self normalGradientColors] forKey:
        @"normalGradientColors"];
    [encoder encodeObject:[self normalGradientLocations] forKey:
        @"normalGradientLocations"];
    [encoder encodeObject:[self highlightGradientColors] forKey:
        @"highlightGradientColors"];
    [encoder encodeObject:[self highlightGradientLocations] forKey:
        @"highlightGradientLocations"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        [self setNormalGradientColors:[decoder decodeObjectForKey:
                @"normalGradientColors"]];
        [self setNormalGradientLocations:[decoder decodeObjectForKey:
                @"normalGradientLocations"]];
        [self setHighlightGradientColors:[decoder decodeObjectForKey:
                @"highlightGradientColors"]];
        [self setHighlightGradientLocations:[decoder decodeObjectForKey
                :@"highlightGradientLocations"]];
        self.strokeColor =
            [UIColor colorWithRed:0.076 green:0.103 blue:0.195 alpha:1.0];
        self.strokeWeight = 1.0;

        if (self.normalGradientColors == nil) {
            //  [self useWhiteStyle];
        }

        [self setOpaque:NO];
        self.backgroundColor =
            [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    }

    return self;
}   /* initWithCoder */

+ (NSString *)resolveImageResource:(NSString *)resource
{
    NSString    *systemVersion  = [[UIDevice currentDevice] systemVersion];
    BOOL        isLessThaniOS4  =
        ([systemVersion compare:@"4.0" options:NSNumericSearch] ==
        NSOrderedAscending);

    if (isLessThaniOS4) {
        return [NSString stringWithFormat:@"%@.png", resource];
    } else {
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]
                == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
            return [NSString stringWithFormat:@"%@@2x.png", resource];
        }
    }

    return resource;    // if all else fails
}                       /* resolveImageResource */


@end
