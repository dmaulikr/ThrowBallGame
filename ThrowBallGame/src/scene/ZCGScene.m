//
//  ZCGScene.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//
#import <string.h>
#import "ZCGScene.h"

@implementation ZCGScene

- (void)InitScene:(ZCGBackground *)p_backgnd
{
    mp_backgnd = p_backgnd;
}

- (void)LoadScene:(const char *)strScene
{
    if (strcmp(strScene, "field")) {
        
    }
}

@end
