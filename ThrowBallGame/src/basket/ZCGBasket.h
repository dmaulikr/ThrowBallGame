//
//  ZCGameBasket.h
//  ThrowBallGame
//
//  Created by zhu on 4/2/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../gameView/ZCGImageView.h"
#import "../ball/ZCGBall.h"

@interface ZCGBasket : UIView
{
    ZCGImageView *mp_basketEntireImageView;
    ZCGImageView *mp_basketSectionImageView;
    
    int m_nContainerIndex;
    
    CGPoint m_basketCenterPoint;
    
    ZCGBall *mp_gameBall;
    
}
- (void)InitBasket;
- (void)ReceiveBall : (ZCGBall *)p_ballSrc;
- (void)LostBall;
- (void)MoveBasketToPoint:(CGPoint)point;

@end