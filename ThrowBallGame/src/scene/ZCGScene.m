//
//  ZCGScene.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//
#import <string.h>
#import "ZCGScene.h"
#import "../background/ZCGBackground.h"

@implementation ZCGScene

- (void)dealloc
{
    [super dealloc];
}

- (void)LoadScene:(const char *)strScene
{
    if (strcmp(strScene, "field") == 0) {
        
    }
}

+ (void)LoadScene:(ZCGBackground *)p_backgnd
{
    // nothing to do
}

@end
