//
//  ZCGGameContainerMgr.m
//  ThrowBallGame
//
//  Created by zhu on 4/9/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGGameContainerMgr.h"
#import "../gameView/ZCGView.h"
#import "../thing/ball/ZCGBall.h"
#import "../thing//basket/ZCGBasket.h"

@interface ZCGGameContainerMgr ()

@end


@implementation ZCGGameContainerMgr
@synthesize mp_gameBall;
@synthesize mp_gameBasket;
@synthesize mp_gameContainer;


- (void)dealloc
{
    [mp_gameBall release];
    [mp_gameBasket release];
    
    [super dealloc];
}

- (void)InitGameContainer:(ZCGView *)p_gameContainer
{
    self.mp_gameContainer = p_gameContainer;
    
    
}


@end
