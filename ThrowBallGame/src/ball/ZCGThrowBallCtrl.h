//
//  ZCGThrowBallCtrl.h
//  ThrowBallGame
//
//  Created by zhu on 4/4/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCGameBall.h"
#import "ZCGameBasket.h"
#import "ZCGameHole.h"

#define BG_ACC 10
#define BG_BALL_TIME_STEP 0.1

#define BG_HOLE_COUNT 3
#define BG_GROUND_X_DEFAULT 30

@interface ZCGThrowBallCtrl : NSObject
{
    ZCGameBall *mp_gameBall;
    ZCGameBasket *mp_gameBasket;
    ZCGameHole *mp_gameHoleArr[BG_HOLE_COUNT];
    
    float m_fBallVelocityInit;
    float m_fBallVelocityAngleInit;
    
    int m_nStartToThrowBall;
    int m_nFinishThrowBall;
    
    CGPoint m_ball_current_point;
    CGPoint m_ball_point_init;
    
    int m_n_ground_x;
    int m_n_touch_gnd_count;
    
    // indicate if ball have touched the ground ever
    int m_nTouchGndFlag;
    
    double m_fBallMovetTime;
    
}
- (BOOL)ThrowBall;
- (void)BallMotion;
- (BOOL)CheckBallOutOfBound;
- (BOOL)CheckMeetHole;
- (BOOL)CheckMeetBasket;
- (void)EndBallMotion;


@end
