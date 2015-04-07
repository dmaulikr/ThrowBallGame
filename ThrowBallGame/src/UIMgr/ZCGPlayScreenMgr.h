//
//  ZCGPlayScreen.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZCGView;
@class ZCGBall;
@class ZCGBasket;
@class ZCGBackground;

#define BG_POWER_PLUS_BUTTON_ID 0
#define BG_POWER_REDUCE_BUTTON_ID 1

#define BG_DIRECTION_PLUS_BUTTON_ID 2
#define BG_DIRECTION_REDUCE_BUTTON_ID 3

#define BG_THROW_BUTTON_ID 4
#define BG_HOME_BUTTON_ID 5

#define BG_PRE_CARD_BUTTON_ID 6
#define BG_NEXT_CARD_BUTTON_ID 7


@interface ZCGPlayScreenMgr : NSObject
{
    int m_nPlaySubviewIndex;
}
@property(nonatomic, retain) ZCGView *mp_playViewContainer;
@property(nonatomic, retain) ZCGBall *mp_gameBall;
@property(nonatomic, retain) ZCGBasket *mp_gameBasket;
@property(nonatomic, retain) ZCGBackground *mp_backgnd;
@property(nonatomic, retain) ZCGView *mp_touchView;
// mp_gameContainer is used to put the ball basket hole and so on
@property(nonatomic, retain) ZCGView *mp_gameContainer;

- (BOOL)InitPlayScreen:(ZCGView *)p_mainPlayView;

- (void)InitPlayScreenLabel;

- (void)InitPlayScreenButton;
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;

@end

















