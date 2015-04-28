//
//  ZGameCard.h
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCGStat.h"

@class ZCGThing;

#ifndef _ZCG_STAT_H_
#define _ZCG_STAT_H_

#define BG_TOUCH_GND_NUMBER_MAX 4

// 4 situation of hole 0 1 2 3
// 4 cards for each situation of hole
#define BG_EACH_SCENE_CARD_MAX (4*4)

#endif

@interface ZCGCard : ZCGStat
{
    //int m_nCurrentCard;
    CGPoint middleHoleCenterPoint;
}

- (void)CardManage;
- (void)FirstCard;
- (void)NextCard;
- (void)NextSubcard;
- (void)PreCard;

- (void)LoadCard;
- (void)LoadHole;
- (void)ConfigCard;

- (void)CurrentCardSuccess;
- (void)CurrentCardFailure;

@end
