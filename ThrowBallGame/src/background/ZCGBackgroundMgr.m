//
//  ZCGBackgroundMgr.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//
#import <string.h>
#import "ZCGBackgroundMgr.h"
#import "ZCGBackground.h"
#import "../scene/ZCGField.h"


@implementation ZCGBackgroundMgr
@synthesize mp_background;

- (void)dealloc
{
    [mp_background release];
    
    [super dealloc];
}

- (void)InitBackground:(ZCGBackground *)p_backgnd
{
    //self.mp_backgndContainer = p_backgndContainer;
    //mp_background = [[ZCGBackground alloc] initWithFrame:mp_backgndContainer.frame];
    
    //[mp_backgndContainer insertSubview:mp_background atIndex:0];
    self.mp_background = p_backgnd;
}


- (void)LoadScene:(const char *)strScene
{
    if (strcmp(strScene, "field")) {
        [ZCGField LoadScene:mp_background];
    }
}

@end
