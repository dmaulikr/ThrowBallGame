//
//  ZGameCard.h
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCGameStat.h"

#define BG_TOUCH_GND_NUMBER_MAX 4

@interface ZCGameCard : ZCGameStat
{
    //int m_nCurrentCard;
}
- (BOOL)Init;
- (void)CardManage;
- (void)NextCard;

@end
