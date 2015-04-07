//
//  ZCGameBasket.h
//  ThrowBallGame
//
//  Created by zhu on 4/2/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "../ZCGThing.h"

@class ZCGBall;

@interface ZCGBasket : ZCGThing
{
    int m_nContainerIndex;
    CGPoint m_basketCenterPoint;
}
@property(nonatomic, retain) ZCGBall *mp_gameBall;
- (void)InitBasket;
- (void)ReceiveBall : (ZCGBall *)p_ballSrc;
- (void)LostBall;
- (void)MoveBasketToPoint:(CGPoint)point;

@end
