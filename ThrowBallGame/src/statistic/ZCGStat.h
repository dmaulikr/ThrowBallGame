//
//  ZGameStat.h
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZCGThing;
@class ZCGBall;
@class ZCGHole;
@class ZCGBasket;

#ifndef _GAME_STATISTICS_
#define _GAME_STATISTICS_
typedef struct _GAME_STATISTICS_
{
    int nCurrentLife;
    int nCurrentCard;
    int nCurrentScore;
    int nNeedTouchGndNum;
    int nCurrentCardHoleNum;
}GAME_STATISTICS, *P_GAME_STATISTICS;
#endif

#ifndef _GAME_ELEMENT_
#define _GAME_ELEMENT_
typedef struct _GAME_ELEMENT_
{
    ZCGBall *p_ball;
    ZCGBasket *p_basket;
    ZCGHole **p_holeArr;
    int nHoleCount;
}GAME_ELEMENT, *P_GAME_ELEMENT;

#endif



@interface ZCGStat : NSObject
{    
    GAME_STATISTICS m_gameStat;
    GAME_ELEMENT m_gameElement;
}
- (BOOL)InitStat;
// setter and getter methods declare section
- (void)SetCurrentLife:(int)nLife;
- (int)GetCurrentLife;
- (void)SetCurrentCard:(int)nCard;
- (int)GetCurrentCard;
- (void)SetNeedTouchGndNum : (int)nNum;
- (int)GetNeedTouchGndNum;


- (void)SetGameStat:(GAME_STATISTICS *)p_statSrc;

- (GAME_STATISTICS *)GetGameStat;
- (void)SetGameElement:(P_GAME_ELEMENT) p_elementSrc;
- (P_GAME_ELEMENT)GetGameElement;

- (void)UpdateLife : (BOOL)bGoal;
- (void)UpdateScore : (BOOL)bGoal;



@end
