//
//  ZGameCard.m
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGCard.h"

#import "../thing/ZCGThing.h"
#import "../thing//hole/ZCGHole.h"

@interface ZCGCard ()
{
    
}
- (BOOL)InitCard;
@end


@implementation ZCGCard


- (void)dealloc
{
    
    [super dealloc];
}


- (id)init
{
    self = [super init];
    
    if (self) {
        // to-do init code
        [self InitCard];
    }
    
    return self;
}

- (BOOL)InitCard
{
    [self SetCurrentCard:1];
    
    middleHoleCenterPoint = CGPointMake(20, 220);
    
    return TRUE;
}


- (void)CardManage
{
    P_GAME_STATISTICS pGameStat = [self GetGameStat];
    
    if (pGameStat->nCurrentCard > BG_EACH_SCENE_CARD_MAX) {
        // to-do
        // this scene have been finished
        // and needed code
        
        //return;
    }
    
    // m_nNeedTouchGndCount
    int nTemp = (pGameStat->nCurrentCard - 1) / BG_TOUCH_GND_NUMBER_MAX;
    
    if (pGameStat->nCurrentCardHoleNum != nTemp) {
        pGameStat->nCurrentCardHoleNum = nTemp;
        pGameStat->nNeedTouchGndNum = 0;
    }
    
    pGameStat->nNeedTouchGndNum = (pGameStat->nCurrentCard - 1) -
                                            pGameStat->nCurrentCardHoleNum * BG_TOUCH_GND_NUMBER_MAX;
    
    [self LoadCard];
}

- (void)FirstCard
{
    [self InitStat];
    
    [self CardManage];
}

- (void)NextCard
{
    [self GetGameStat]->nCurrentCard++;
    if ([self GetGameStat]->nCurrentCard >= BG_EACH_SCENE_CARD_MAX) {
        [self GetGameStat]->nCurrentCard = BG_EACH_SCENE_CARD_MAX;
        //return;
    }
    
    [self CardManage];
}

- (void)NextSubcard
{
    [self CardManage];
}

- (void)PreCard
{
    P_GAME_STATISTICS pGameStat = [self GetGameStat];
    
    pGameStat->nCurrentCard--;
    
    if (pGameStat->nCurrentCard <= 1) {
        pGameStat->nCurrentCard = 1;
    }
    
    [self CardManage];
}


- (void)LoadCard
{
    [self LoadHole];
}

- (void)LoadHole
{
    CGPoint pointTemp;
    P_GAME_STATISTICS pGameStat = [self GetGameStat];
    P_GAME_ELEMENT p_gameElememt = [self GetGameElement];
    ZCGThing **pHoleList = p_gameElememt->p_holeArr;
    int nHoleCount = p_gameElememt->nHoleCount;
    
    if (pGameStat->nCurrentCardHoleNum == 0) {
        for (int i = 0; i < nHoleCount; i++) {
            pHoleList[i].hidden = YES;
        }
    }
    else if (pGameStat->nCurrentCardHoleNum == 1) {
        pHoleList[0].center = middleHoleCenterPoint;
        pHoleList[0].hidden = NO;
        
        
        for (int i = 1; i < nHoleCount; i++) {
            pHoleList[i].hidden = YES;
        }
    }
    else if (pGameStat->nCurrentCardHoleNum == 2) {
        pointTemp = middleHoleCenterPoint;
        pointTemp.y -= 50;
        pHoleList[0].center = pointTemp;
        pHoleList[0].hidden = NO;
        pointTemp = middleHoleCenterPoint;
        pointTemp.y += 50;
        pHoleList[1].center = pointTemp;
        pHoleList[1].hidden = NO;
        
        for (int i = 2; i < nHoleCount; i++) {
            pHoleList[i].hidden = YES;
        }
    }
    else if (pGameStat->nCurrentCardHoleNum == 3) {
        pHoleList[0].center = middleHoleCenterPoint;
        pHoleList[0].hidden = NO;
        pointTemp = middleHoleCenterPoint;
        pointTemp.y -= 70;
        pHoleList[1].center = pointTemp;
        pHoleList[1].hidden = NO;
        pointTemp = middleHoleCenterPoint;
        pointTemp.y += 70;
        pHoleList[2].center = pointTemp;
        pHoleList[2].hidden = NO;
        
        
//        for (int i = 3; i < nHoleCount; i++) {
//            pHoleList[i].hidden = YES;
//        }
    }
    
    return;
}


- (void)ConfigCard
{
    
}


- (void)CurrentCardSuccess
{
    P_GAME_STATISTICS pGameStat = [self GetGameStat];
    pGameStat->nCurrentScore++;
}

- (void)CurrentCardFailure
{
    P_GAME_STATISTICS pGameStat = [self GetGameStat];
    pGameStat->nCurrentLife--;
    
    if (pGameStat->nCurrentLife <= 0)
    {
        pGameStat->nCurrentLife = 0;
    }
}






@end














