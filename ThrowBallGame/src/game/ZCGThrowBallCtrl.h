//
//  ZCGThrowBallCtrl.h
//  ThrowBallGame
//
//  Created by zhu on 4/4/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

// a class designed to process the motion of the ball

#import <Foundation/Foundation.h>

@class ZCGBall;
@class ZCGHole;
@class ZCGBasket;

#ifndef _ZCG_ThrowBallCtrl_H_
#define _ZCG_ThrowBallCtrl_H_

#define BG_ACC 10
#define BG_BALL_TIME_STEP 0.1

#define BG_HOLE_COUNT_MAX 10
#define BG_GROUND_X_DEFAULT 30

#define BG_MOVING 0
#define BG_MEET_HOLE 1
#define BG_MEET_BASKET 2
#define BG_OUT_OF_BOUND 3
#define BG_SOFTWARE_STOP 4


#endif

@interface ZCGThrowBallCtrl : NSObject
{
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
    int m_nNeedTouchGndNum;
    
    // indicate if ball have touched the ground ever
    int m_nTouchGndFlag;
    
    int m_nThrowBallState;
    
    double m_fBallMovetTime;
    
}
@property(nonatomic, retain) ZCGBall *mp_gameBall;
@property(nonatomic, retain) ZCGBasket *mp_gameBasket;

// the main method to handle the motion of the ball
- (BOOL)ThrowBall;
- (void)BallMotion;
- (BOOL)CheckBallOutOfBound;
- (BOOL)CheckMeetHole;
- (BOOL)CheckMeetBasket;
- (void)EndBallMotion;

// and the element of the game
- (void)SetBasket:(ZCGBasket *)p_basket;
- (void)SetBall:(ZCGBall *)p_ball;
- (BOOL)TryAddHole:(ZCGHole *)p_hole;

- (void)Stop;
- (void)Ready;
// set the ball velocity
- (void)SetVelocity:(float)fVelocity;
// orientation in degree
- (void)SetDirectionDeg:(float)fAngleDeg;
// orientation in radian
- (void)SetDirectionRad:(float)fAngleRad;
// the name of the method indicates the function
- (void)SetNeedTouchGndNum:(int)nNum;

- (void)SetVelocityAndDirection:(float)fVelocity directionDeg:(float)fAngleDeg;
- (void)SetVelocityAndDirection:(float)fVelocity directionRad:(float)fAngleRad;

// switch between the degree and radian
- (float)Deg2Rad:(float)fDeg;
- (float)Rad2Deg:(float)fRad;



@end
