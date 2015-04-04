//
//  ZGameCard.m
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGameCard.h"

@implementation ZCGameCard

- (BOOL)Init
{
    [self SetCurrentCard:1];
    
    return TRUE;
}

- (void)CardManage
{
    P_GAME_STATISTICS pGameStat = [self GetGameStat];
    
    
    // m_nNeedTouchGndCount
    int nTemp = (pGameStat->nCurrentCard - 1) / BG_TOUCH_GND_NUMBER_MAX;
    
    if (pGameStat->nCurrentCardHoleNum != nTemp) {
        pGameStat->nCurrentCardHoleNum = nTemp;
        pGameStat->nNeedTouchGndCount = 0;
    }
    
    pGameStat->nNeedTouchGndCount = pGameStat->nCurrentCard - pGameStat->nCurrentCardHoleNum * BG_TOUCH_GND_NUMBER_MAX;
    
    
    if (pGameStat->nCurrentCardHoleNum == 0) {
    }
    else if (pGameStat->nCurrentCardHoleNum == 1)
    {
    }
    else if (pGameStat->nCurrentCardHoleNum == 2)
    {
    }
    else if (pGameStat->nCurrentCardHoleNum == 3)
    {
    }
}

- (void)NextCard
{
    [self GetGameStat]->nCurrentCard++;
}







@end














