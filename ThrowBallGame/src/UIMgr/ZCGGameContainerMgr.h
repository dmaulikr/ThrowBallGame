//
//  ZCGGameContainerMgr.h
//  ThrowBallGame
//
//  Created by zhu on 4/9/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZCGBall;
@class ZCGBasket;
@class ZCGHole;
@class ZCGView;


@interface ZCGGameContainerMgr : NSObject
{
    
}
@property(nonatomic,retain)  ZCGView *mp_gameContainer;
@property(nonatomic, retain) ZCGBall *mp_gameBall;
@property(nonatomic, retain) ZCGBasket *mp_gameBasket;
//@property(nonatomic, retain) ZCGHole *mp_hole;

- (void)InitGameContainer:(ZCGView *)p_gameContainer;

@end
