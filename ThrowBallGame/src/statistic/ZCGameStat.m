//
//  ZGameStat.m
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGameStat.h"

@implementation ZCGameStat

- (BOOL)Init
{
    m_gameStat.nCurrentLife = 0;
    m_gameStat.nCurrentCard = 0;
    m_gameStat.nNeedTouchGndCount = 0;
    m_gameStat.nCurrentCardHoleNum = 0;
    
    
    return TRUE;
}

// setter and getter methods implement section
- (void)SetCurrentLife:(int)nLife
{
    //m_nCurrentLife = nLife;
    m_gameStat.nCurrentLife = nLife;
}

- (int)GetCurrentLife
{
    return m_gameStat.nCurrentLife;
}

- (void)SetCurrentCard:(int)nCard
{
    m_gameStat.nCurrentCard = nCard;
}

- (int)GetCurrentCard
{
    return m_gameStat.nCurrentCard;
}

- (void)SetNeedTouchGndCount : (int)nCount
{
    m_gameStat.nNeedTouchGndCount = nCount;
}

- (int)GetNeedTouchGndCount
{
    return m_gameStat.nNeedTouchGndCount;
}

- (GAME_STATISTICS *)GetGameStat
{
    return &m_gameStat;
}


- (void)UpdateLife : (BOOL)bGoal
{
    
}


- (void)UpdateScore : (BOOL)bGoal
{
    
}









@end
