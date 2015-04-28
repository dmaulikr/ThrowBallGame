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

#define BG_HOLE_COUNT 3

#endif

@interface ZCGGame : NSObject
{
    ZCGHole *mp_holeArr[BG_HOLE_COUNT];
    
    ZCGUIMgr *mp_gameUIMgr;
    
    ZCGThrowBallCtrl *mp_throwBallCtrl;
    
    int m_nGameContainerSubviewIndex;
    ZCGThing *mp_gameContainer;
    
    ZCGCard *mp_gameCard;
    
    int m_nCount;
}
@property(nonatomic, retain) ZCGBall *mp_gameBall;
@property(nonatomic, retain) ZCGBasket *mp_gameBasket;

- (void)InitGameWithMainView:(ZCGView *)p_mainGameView;
- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType;
- (void)SendGameStatChangeMsg;
- (void)SetNotifyInfo:(NSString *)pInfo;
@end




















