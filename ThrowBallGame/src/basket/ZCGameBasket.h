//
//  ZCGameBasket.h
//  ThrowBallGame
//
//  Created by zhu on 4/2/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../gameView/ZCGameImageView.h"
#import "../ball/ZCGameBall.h"

@interface ZCGameBasket : UIView
{
    ZCGameImageView *mp_basketEntireImageView;
    ZCGameImageView *mp_basketSectionImageView;
    
    int m_nContainerIndex;
    
    CGPoint m_basketCenterPoint;
    
    ZCGameBall *mp_gameBall;
    
}
- (void)InitBasket;
- (void)ReceiveBall : (ZCGameBall *)p_ballSrc;
- (void)LostBall;
- (void)MoveBasketToPoint:(CGPoint)point;

@end
