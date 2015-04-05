//
//  ZCGTimer.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCGTimer : NSTimer
{
    
}
+ (void)LaunchTimer:(double)dTimeInterval target:(id)aTarget selector:(SEL)aSelector repeats:(BOOL) bRepeat;
@end
