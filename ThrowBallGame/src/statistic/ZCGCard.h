//
//  ZGameCard.h
//  ThrowBallGame
//
//  Created by zhu on 3/25/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCGStat.h"

#define BG_TOUCH_GND_NUMBER_MAX 4

@interface ZCGCard : ZCGStat
{
    //int m_nCurrentCard;
}
- (void)CardManage;
- (void)NextCard;

@end
