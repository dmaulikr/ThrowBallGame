//
//  ZCGPlayScreen.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "../gameView/ZCGView.h"

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
    ZCGView *mp_playViewContainer;
    int nSubviewIndex;
    
    UIButton *mp_homeButton;
    UIButton *mp_throwButton;
    UIButton *mp_nextCardButton;
    UIButton *mp_preCardButton;
    
    UILabel *mp_stateLabel;
}
- (BOOL)InitPlayScreen:(ZCGView *)p_mainPlayView;

- (void)InitPlayScreenButton;
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;

@end

















