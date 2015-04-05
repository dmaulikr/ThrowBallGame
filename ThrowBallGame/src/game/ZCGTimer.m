//
//  ZCGTimer.m
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGTimer.h"

@implementation ZCGTimer

- (id)init
{
    self = [super init];
    
    if (self) {
        // to-do initialize code
    }
    
    return self;
}

+ (void)LaunchTimer:(double)dTimeInterval target:(id)aTarget selector:(SEL)aSelector repeats:(BOOL) bRepeat
{
    //NSTimer *p_show_timer =
    [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)dTimeInterval
     
                                     target:aTarget
     
                                   selector:aSelector
     
                                   userInfo:nil
     
                                    repeats:bRepeat];
}

@end
