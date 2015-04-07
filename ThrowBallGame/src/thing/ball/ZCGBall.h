//
//  ZCGameBall.h
//  ThrowBallGame
//
//  Created by zhu on 4/1/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "../ZCGThing.h"

@interface ZCGBall : ZCGThing
{
    
}
- (void)InitBall : (NSString *)file_name
       with_type : (NSString *)file_type;
- (void)SetBallSize : (CGRect)rect;
- (void)MoveBallToPoint : (CGPoint)point;

@end
