//
//  ZCGThrowBallCtrl.m
//  ThrowBallGame
//
//  Created by zhu on 4/4/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGThrowBallCtrl.h"
#import "../thing/ball/ZCGBall.h"
#import "../thing/basket/ZCGBasket.h"
#import "../thing/hole/ZCGHole.h"


@interface ZCGThrowBallCtrl ()
{
    
}
- (void)AttributeInit;
@end


@implementation ZCGThrowBallCtrl
@synthesize mp_gameBall;
@synthesize mp_gameBasket;


- (void)dealloc
{
    if (m_nCurrentHoleCount != 0) {
        for (int i = 0; i < m_nCurrentHoleCount; i++) {
            [mp_gameHoleArr[i] release];
            mp_gameHoleArr[i] = nil;//
        }
    }
    
    [mp_gameBall release];    
    [mp_gameBasket release];
    
    [super dealloc];
}


- (id)init
{
    self = [super init];
    
    if (self) {
        // to-do init code
        [self AttributeInit];
    }
    
    return self;
}

- (void)AttributeInit
{
    mp_gameBall = nil;
    mp_gameBasket = nil;
    
        
    for (int i = 0; i < BG_HOLE_COUNT_MAX; i++) {
        mp_gameHoleArr[i] = nil;
    }
    
    
    m_fBallVelocityInit = 0;
    m_fBallVelocityAngleDegInit = 0;
    
    m_nStartToThrowBall = 0;
    m_nFinishThrowBall = 0;
    
    m_ball_current_point = CGPointMake(0,0);
    m_ball_point_init = CGPointMake(0,0);
    
    m_n_ground_x = BG_GROUND_X_DEFAULT;
    m_n_touch_gnd_count = 0;
    
    // indicate if ball have touched the ground ever
    m_nTouchGndFlag = 0;
    
    m_fBallMovetTime = 0.0;
    
    return;
}

- (void)SetBasket:(ZCGBasket *)p_basket
{
    self.mp_gameBasket = p_basket;
}

- (void)SetBall:(ZCGBall *)p_ball
{
    self.mp_gameBall = p_ball;
}

- (BOOL)TryAddHole:(ZCGHole *)p_hole
{
    if (m_nCurrentHoleCount >= BG_HOLE_COUNT_MAX) {
        return NO;
    }
    
    [p_hole retain];
    [mp_gameHoleArr[m_nCurrentHoleCount++] release];
    mp_gameHoleArr[m_nCurrentHoleCount] = p_hole;
    
    return YES;
}

// rectangular	coordinate system
// the I is 0--90 degree
// the II is 90--180 degree
// the III is 180 -- 270 degree
// the IV is 270 -- 360 degree
- (void)SetVelocityAndDirection:(float)fVelocity directionDeg:(float)fAngleDeg
{
    m_fBallVelocityAngleDegInit = fAngleDeg;
    m_fBallVelocityInit = fVelocity;
}

- (void)SetVelocityAndDirection:(float)fVelocity directionRad:(float)fAngleRad
{
    m_fBallVelocityAngleDegInit = [self Rad2Deg:fAngleRad];
    m_fBallVelocityInit = fVelocity;
}

- (float)Deg2Rad:(float)fDeg
{
    return (fDeg * M_PI / 180.0);
}

- (float)Rad2Deg:(float)fRad
{
    return (fRad * 180.0 / M_PI);
}

- (void)ThrowBallInit
{
    m_nStartToThrowBall = 1;
    m_nFinishThrowBall = 0;
    
    m_n_touch_gnd_count = 0;
    
    // indicate if ball have touched the ground ever
    m_nTouchGndFlag = 0;
    
    m_fBallMovetTime = 0.0;
    
    m_ball_point_init = [mp_gameBall GetCenterPosition];
    
    return;
}


// return NO,if end of moving ball
// return YES, if ball continues moving
- (BOOL)ThrowBall
{
    if (m_nStartToThrowBall != 1)
    {
        m_fBallMovetTime = 0.0;
        return NO;
    }
    
    if (m_nFinishThrowBall == 1)
    {
        m_fBallMovetTime = 0.0;
        m_nStartToThrowBall = 0;
        return NO;
    }

    [self BallMotion];
    
    if ([self CheckBallOutOfBound]||[self CheckMeetHole]||[self CheckMeetBasket])
    {
        [self EndBallMotion];
        return NO;
    }
    
    
    return YES;
}


- (void)BallMotion
{
    //float f_v_0 = BG_BALL_INIT_VELOCITY_MAX;
    float f_v_0 = m_fBallVelocityInit;
    float f_angle_v_0 = [self Deg2Rad:m_fBallVelocityAngleDegInit];
    float f_h_v_0;
    float f_v_v_0;
    //float h = m_f_ball_altitude_init;// altitude
    float g = BG_ACC;// jia shu du
    float s_v = 0.0;//s on verical
    float s_h = 0.0;// s on horri
    //static double t = 0;
    
    
    //f_angle_v_0 = f_angle_v_0 * M_PI / 180;
    f_h_v_0 = f_v_0 * cos(f_angle_v_0);
    f_v_v_0 = f_v_0 * -sin(f_angle_v_0);
    
    s_v = f_v_v_0 * m_fBallMovetTime + 0.5 * g * m_fBallMovetTime * m_fBallMovetTime;
    s_h = f_h_v_0 * m_fBallMovetTime;
    m_fBallMovetTime += BG_BALL_TIME_STEP;
    
    m_ball_current_point.x = m_ball_point_init.x - s_v;
    m_ball_current_point.y = m_ball_point_init.y + s_h;
    
    if (m_ball_current_point.x < m_n_ground_x)
    {
        m_ball_current_point.x = m_n_ground_x;
        m_n_touch_gnd_count++;
        m_nTouchGndFlag = 1;
        
        m_fBallMovetTime -= BG_BALL_TIME_STEP;
        if (m_n_touch_gnd_count == 1) {
            f_v_v_0 += g * m_fBallMovetTime;
            f_v_v_0 *= -0.9;
            f_h_v_0 *= 0.95;
        }
        else
        {
            //f_v_v_0 += g * t;
            f_v_v_0 *= 0.9;
            f_h_v_0 *= 0.95;
        }
        
        m_ball_point_init = m_ball_current_point;
        m_fBallMovetTime = 0;
        
        m_fBallVelocityInit = sqrtf(f_v_v_0 * f_v_v_0 + f_h_v_0 * f_h_v_0);
        
        if (f_h_v_0 == 0) {
            if (f_v_v_0 > 0) {
                m_fBallVelocityAngleDegInit = -89;
            }
            else
            {
                m_fBallVelocityAngleDegInit = 89;
            }
        }
        else
        {
            m_fBallVelocityAngleDegInit = [self Rad2Deg:-atan((f_v_v_0 / f_h_v_0))];
            if (m_fBallVelocityAngleDegInit >= 89) {
                m_fBallVelocityAngleDegInit = 89;
            }
            else if (m_fBallVelocityAngleDegInit <= -89)
            {
                m_fBallVelocityAngleDegInit = -89;
            }
        }
    }// end if (m_ball_current_point.x < m_n_ground_x)
    
    [mp_gameBall MoveBallToPoint:m_ball_current_point];
    
    return;
}

// return YES, if ball is out of the bounds
// or return NO
- (BOOL)CheckBallOutOfBound
{
    if (m_ball_current_point.y >= 600)
    {
        //[self EndBallMotionHandle];
        return YES;
    }
    
    return NO;
}


// if the ball meet any hole, return YES
// or return NO
- (BOOL)CheckMeetHole
{
    CGPoint ballCenterPoint = [mp_gameBall GetCenterPosition];
    CGPoint point_3;
    
    if (m_nCurrentHoleCount <= 0) {
        return NO;
    }
    
    for (int i = 0; i < m_nCurrentHoleCount; i++) {
        // judge if the ball falls into the hole
        point_3.x = ballCenterPoint.x - mp_gameHoleArr[i].center.x;
        point_3.y = ballCenterPoint.y - mp_gameHoleArr[i].center.y;
        if (sqrt(point_3.x * point_3.x + point_3.y * point_3.y) <= 15 && mp_gameHoleArr[i].hidden == NO)
        {
            m_ball_current_point.y = 10000;
            [mp_gameBall MoveBallToPoint:m_ball_current_point];
            //[self EndBallMotionHandle];
            return YES;
        }
    }
    
    return NO;
}

// if the ball is meet the basket and their centre points are very close
// return YES, OR return NO
- (BOOL)CheckMeetBasket
{
    if (mp_gameBasket == nil) {
        return NO;
    }
    
    CGPoint point_1 = [mp_gameBall GetCenterPosition];
    CGPoint point_2 = mp_gameBasket.center;
    CGPoint point_12;
    
    point_12.x = point_1.x - point_2.x;
    point_12.y = point_1.y - point_2.y;
    
    double df_temp = sqrt(point_12.x * point_12.x + point_12.y * point_12.y);
    
    if (df_temp <= 15)
    {
        [mp_gameBasket ReceiveBall:mp_gameBall];
        //[self EndBallMotionHandle];
        return YES;
    }
    
    return NO;
}


- (void)EndBallMotion
{
    if (m_nTouchGndFlag == 1) {
        m_n_touch_gnd_count--;
    }
    
    //NSLog(@"tgc: %d\n",m_n_touch_gnd_count);
    
    m_fBallMovetTime = 0;
    m_nFinishThrowBall = 1;
    m_nStartToThrowBall = 0;
    
    //[self Judge_The_Throw_Ball_Result];
    
    //m_n_touch_gnd_count = 0;
    
    return;
}

@end



























