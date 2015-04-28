//
//  ZCGPlayScreen.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//


// the play view manager of the game


#import <Foundation/Foundation.h>
#import "UIMgrHeader.h"



@class ZCGView;
@class ZCGBall;
@class ZCGBasket;
@class ZCGBackground;
@class ZCGDrawView;
@class ZCGUIMgr;
@class ZCGStat;
@class ZCGThing;



#ifndef _ZCG_PlayScreenMgr_H_
#define _ZCG_PlayScreenMgr_H_

#define BG_TOUCH_BEGAN 0
#define BG_TOUCH_MOVE 1
#define BG_TOUCH_END 2



#define BG_INDICATOR_LONG 100
#define BG_INDICATOR_WIDTH 10
// power indicator size
#define BG_POWRE_VIEW_LONG 100
#define BG_POWRE_VIEW_WIDTH 10


#define BG_POWER_PLUS_BUTTON_ID 0
#define BG_POWER_REDUCE_BUTTON_ID 1

#define BG_DIRECTION_PLUS_BUTTON_ID 2
#define BG_DIRECTION_REDUCE_BUTTON_ID 3

#define BG_THROW_BUTTON_ID 4
#define BG_HOME_BUTTON_ID 5

#define BG_PRE_CARD_BUTTON_ID 6
#define BG_NEXT_CARD_BUTTON_ID 7

#define BALL_LIMIT_X 250
#define BALL_LIMIT_Y 80

#endif


@interface ZCGPlayScreenMgr : NSObject
{
    // to be used as the index when invoke the insertSubview method of (ZCGView *)mp_playViewContainer
    int m_nPlaySubviewIndex;
    
    // the power indicator property define
    CGPoint power_indicator_start_draw_point;
    float f_power_indicator_draw_line_width;
    float f_power_indicator_draw_line_long;
    
    // the direction indicator property define
    CGPoint direction_indicator_start_draw_point;
    float f_direction_indicator_draw_line_width;
    float f_direction_indicator_draw_line_long;
    float f_direction_deg;
    
    // ball center point storage
    CGPoint ballPoint;
    BOOL m_bNeedDrawArrow;
    
    CGPoint m_gameStatusLabelCenter;
}
@property(nonatomic, retain) ZCGBall *mp_gameBall;
@property(nonatomic, retain) ZCGBasket *mp_gameBasket;
@property(nonatomic, retain) ZCGBackground *mp_backgnd;

@property(nonatomic, retain) UIButton *mp_homeButton;
@property(nonatomic, retain) UIButton *mp_throwButton;
@property(nonatomic, retain) UIButton *mp_nextCardButton;
@property(nonatomic, retain) UIButton *mp_preCardButton;
@property(nonatomic, retain) UIButton *mp_powerPlusButton;
@property(nonatomic, retain) UIButton *mp_powerReduceButton;
@property(nonatomic, retain) UIButton *mp_directionPlusButton;
@property(nonatomic, retain) UIButton *mp_directionReduceButton;

// mp_gameContainer is used to put the ball basket hole and so on
@property(nonatomic, retain) ZCGThing *mp_gameContainer;
//@property(nonatomic, retain) ZCGUIMgr *mp_gameUIMgr;

//@property(nonatomic, retain) ZCGStat *mp_gameStat;

- (BOOL)InitPlayScreen:(ZCGView *)p_mainPlayView;
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;
- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType;
- (void)IndicatorDrawLine:(ZCGDrawView *)p_indicator;

// this returned degree is meaning the ball initialized direction degree
- (float)GetDirectionDeg;
// return the throw ball strength
- (float)GetPower;
- (void)GameStatusLabelMove;
// the info is display on the game status label to do some instruction.
- (void)SetNotifyInfo:(NSString *)pInfo;

@end

















