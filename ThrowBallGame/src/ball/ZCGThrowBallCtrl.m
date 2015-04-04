//
//  ZCGThrowBallCtrl.m
//  ThrowBallGame
//
//  Created by zhu on 4/4/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGThrowBallCtrl.h"

@implementation ZCGThrowBallCtrl

- (id)init
{
    self = [super init];
    
    if (self) {
        // to-do init code
    }
    
    return self;
}

// return NO,if end of moving ball
// return YES, if ball continues moving
- (BOOL)ThrowBall
{    
    m_nFinishThrowBall = 0;
    
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
    float f_angle_v_0 = m_fBallVelocityAngleInit;
    float f_h_v_0;
    float f_v_v_0;
    //float h = m_f_ball_altitude_init;// altitude
    float g = BG_ACC;// jia shu du
    float s_v = 0.0;//s on verical
    float s_h = 0.0;// s on horri
    //static double t = 0;
    
    
    f_angle_v_0 = f_angle_v_0 * M_PI / 180;
    f_h_v_0 = f_v_0 * cos(f_angle_v_0);
    f_v_v_0 = f_v_0 * -sin(f_angle_v_0);
    
    s_v = f_v_v_0 * m_fBallMovetTime + 0.5 * g * m_fBallMovetTime * m_fBallMovetTime;
    s_h = f_h_v_0 * m_fBallMovetTime;
    m_fBallMovetTime += BG_BALL_TIME_STEP;
    
    m_ball_current_point.x = m_ball_point_init.x - s_v;
    m_ball_current_point.y = m_ball_point_init.y + s_h;
    
    //NSLog(@"\ns_v:%f, h: %f, s_h: %f", s_v, h, s_h);
    
    //    tt = t / 0.01;
    
    
    if (m_ball_current_point.x < m_n_ground_x) {
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
                m_fBallVelocityAngleInit = -89;
            }
            else
            {
                m_fBallVelocityAngleInit = 89;
            }
        }
        else
        {
            m_fBallVelocityAngleInit = -atan((f_v_v_0 / f_h_v_0));
            m_fBallVelocityAngleInit = m_fBallVelocityAngleInit * 180 / M_PI;
            if (m_fBallVelocityAngleInit >= 89) {
                m_fBallVelocityAngleInit = 89;
            }
            else if (m_fBallVelocityAngleInit <= -89)
            {
                m_fBallVelocityAngleInit = -89;
            }
        }
        
        //f_ball_velocity_angle_init = f_ball_velocity_angle_init * 180 / M_PI;
    }
    
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
    
    int nHoleIndex = 0;
    
    for (nHoleIndex = 0; nHoleIndex < BG_HOLE_COUNT; nHoleIndex++) {
        // judge if the ball falls into the hole
        point_3.x = ballCenterPoint.x - mp_gameHoleArr[nHoleIndex].center.x;
        point_3.y = ballCenterPoint.y - mp_gameHoleArr[nHoleIndex].center.y;
        if (sqrt(point_3.x * point_3.x + point_3.y * point_3.y) <= 15 && mp_gameHoleArr[nHoleIndex].hidden == NO)
        {
            m_ball_current_point.y = 1000;
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
    CGPoint point_1 = [mp_gameBall GetCenterPosition];
    CGPoint point_2 = mp_gameBasket.center;
    CGPoint point_12;
    
    point_12.x = point_1.x - point_2.x;
    point_12.y = point_1.y - point_2.y;
    
    double df_temp = sqrt(point_12.x * point_12.x + point_12.y * point_12.y);
    
    if (df_temp <= 15)
    {
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
    
    //[self Judge_The_Throw_Ball_Result];
    
    m_n_touch_gnd_count = 0;
    
    return;
}

@end



























