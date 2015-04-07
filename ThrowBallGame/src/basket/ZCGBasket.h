//
//  ZCGameBasket.h
//  ThrowBallGame
//
//  Created by zhu on 4/2/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "../thing/ZCGThing.h"
#import "../ball/ZCGBall.h"
#import "../gameView/ZCGView.h"

@interface ZCGBasket : ZCGThing
{
    ZCGThing *mp_basketEntireImageView;
    ZCGThing *mp_basketSectionImageView;
    
    int m_nContainerIndex;
    
    CGPoint m_basketCenterPoint;
    
    ZCGBall *mp_gameBall;
    
}
- (void)InitBasket;
- (void)ReceiveBall : (ZCGBall *)p_ballSrc;
- (void)LostBall;
- (void)MoveBasketToPoint:(CGPoint)point;

@end
