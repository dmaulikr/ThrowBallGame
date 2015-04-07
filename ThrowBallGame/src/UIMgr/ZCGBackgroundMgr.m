//
//  ZCGBackgroundMgr.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//
#import <string.h>
#import "ZCGBackgroundMgr.h"

@implementation ZCGBackgroundMgr

- (void)InitBackground:(ZCGView *)p_backgndContainer
{
    mp_backgndContainer = p_backgndContainer;
    mp_background = [[ZCGBackground alloc] initWithFrame:mp_backgndContainer.frame];
    
    [mp_backgndContainer insertSubview:mp_background atIndex:0];
}

- (void)LoadScene:(const char *)strScene
{
    if (strcmp(strScene, "field")) {
        [ZCGField LoadField:mp_background];
    }
}

@end
