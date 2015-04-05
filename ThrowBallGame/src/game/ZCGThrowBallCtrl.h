//
//  ZCGThrowBallCtrl.h
//  ThrowBallGame
//
//  Created by zhu on 4/4/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../ball/ZCGBall.h"
#import "../basket/ZCGBasket.h"
#import "../hole/ZCGHole.h"

#define BG_ACC 10
#define BG_BALL_TIME_STEP 0.1

#define BG_HOLE_COUNT_MAX 10
#define BG_GROUND_X_DEFAULT 30

@interface ZCGThrowBallCtrl : NSObject
{
    ZCGBall *mp_gameBall;
    ZCGBasket *mp_gameBasket;
    ZCGHole *mp_gameHoleArr[BG_HOLE_COUNT_MAX];
    
    // count how many hole have add 
    int m_nCurrentHoleCount;
    
    float m_fBallVelocityInit;
    float m_fBallVelocityAngleDegInit;
    
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

- (void)SetBasket:(ZCGBasket *)p_basket;
- (void)SetBall:(ZCGBall *)p_ball;
- (BOOL)TryAddHole:(ZCGHole *)p_hole;


- (void)ThrowBallInit;
- (void)SetVelocityAndDirection:(float)fVelocity directionDeg:(float)fAngleDeg;
- (void)SetVelocityAndDirection:(float)fVelocity directionRad:(float)fAngleRad;


- (float)Deg2Rad:(float)fDeg;
- (float)Rad2Deg:(float)fRad;



@end
