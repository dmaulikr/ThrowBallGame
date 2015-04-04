//
//  ZGameStat.h
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct _GAME_STATISTICS_
{
    int nCurrentLife;
    int nCurrentCard;
    int nNeedTouchGndCount;
    int nCurrentCardHoleNum;
    int nCurrentScore;
}GAME_STATISTICS, *P_GAME_STATISTICS;


@interface ZCGameStat : NSObject
{    
    GAME_STATISTICS m_gameStat;
}
- (BOOL)Init;
// setter and getter methods declare section
- (void)SetCurrentLife:(int)nLife;
- (int)GetCurrentLife;
- (void)SetCurrentCard:(int)nCard;
- (int)GetCurrentCard;
- (void)SetNeedTouchGndCount : (int)nCount;
- (int)GetNeedTouchGndCount;

- (GAME_STATISTICS *)GetGameStat;

- (void)UpdateLife : (BOOL)bGoal;
- (void)UpdateScore : (BOOL)bGoal;



@end
