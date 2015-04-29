//
//  ZCGGame.h
//  ThrowBallGame
//
//  Created by zhu on 4/9/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCGThrowBallCtrl.h"
#import "ZCGTimer.h"

#import "../thing/basket/ZCGBasket.h"
#import "../thing/ball/ZCGBall.h"
#import "../thing/hole/ZCGHole.h"

#import "../gameView/ZCGView.h"
#import "../gameView/ZCGImageView.h"
#import "../gameView/ZCGDrawView.h"

#import "../UIMgr/ZCGUIMgr.h"
#import "../statistic/ZCGStat.h"
#import "../statistic/ZCGCard.h"
#import "../thing/ZCGThing.h"

#ifndef _ZCG_Game_H_
#define _ZCG_Game_H_

// the max num of hole
#define BG_HOLE_COUNT 3

#endif

@interface ZCGGame : NSObject
{
    ZCGHole *mp_holeArr[BG_HOLE_COUNT];
    
    ZCGUIMgr *mp_gameUIMgr;
    
    // this object will handle the behavior and result of the moving ball
    ZCGThrowBallCtrl *mp_throwBallCtrl;
    
    
    int m_nGameContainerSubviewIndex;
    // game container contain the ball basket and holes
    ZCGThing *mp_gameContainer;
    
    // deal with the game level
    ZCGCard *mp_gameCard;
    
    int m_nCount;
}
@property(nonatomic, retain) ZCGBall *mp_gameBall;
@property(nonatomic, retain) ZCGBasket *mp_gameBasket;

// use the main view to initial the game gui
- (void)InitGameWithMainView:(ZCGView *)p_mainGameView;
// ------when any touch event comes about, invoke this method to
// deal with it event.
- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType;
// notify that the game statistics has been changed.
// just send a game message, and other class should intercept the message
// in order to handle the specified message.
- (void)SendGameStatChangeMsg;
// when game level change, this info will be display
- (void)SetNotifyInfo:(NSString *)pInfo;
@end




















