//
//  ZGameStat.m
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGStat.h"

@interface ZCGStat ()
{
    
}
- (BOOL)InitStat;
@end

@implementation ZCGStat

- (id)init
{
    self = [super init];
    
    if (self) {
        // to-do init code
        [self InitStat];
    }
    
    return self;
}

- (BOOL)InitStat
{
    m_gameStat.nCurrentLife = 10;
    m_gameStat.nCurrentCard = 1;
    m_gameStat.nNeedTouchGndCount = 1;
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

- (void)SetGameStat:(GAME_STATISTICS *)p_statSrc
{
    memcpy(&m_gameStat, p_statSrc, sizeof(GAME_STATISTICS));
}

- (void)SetGameElement:(P_GAME_ELEMENT) p_elementSrc
{
    memcpy(&m_gameElement, p_elementSrc, sizeof(GAME_ELEMENT));
}

- (P_GAME_ELEMENT)GetGameElement
{
    return &m_gameElement;
}

- (void)UpdateLife : (BOOL)bGoal
{
    
}


- (void)UpdateScore : (BOOL)bGoal
{
    
}









@end
