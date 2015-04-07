//
//  ZCGStartScreen.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZCGView;

#define BG_START_BUTTON_ID 0
#define BG_HELP_BUTTON_ID 1

@interface ZCGStartScreenMgr : NSObject
{
}
@property(nonatomic, retain) ZCGView *mp_startMainView;
- (BOOL)InitStartScreen:(ZCGView *)p_startMainView;

@end



















