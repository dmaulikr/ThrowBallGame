//
//  ZCGStartScreen.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIMgrHeader.h"
@class ZCGView;
@class ZCGUIMgr;
@class ZCGStat;

#define BG_START_BUTTON_ID 0
#define BG_HELP_BUTTON_ID 1

@interface ZCGStartScreenMgr : NSObject
{
}
@property(nonatomic, retain) ZCGView *mp_startMainView;
//@property(nonatomic, retain) ZCGUIMgr *mp_gameUIMgr;
@property(nonatomic, retain) UIButton *mp_startBtn;
@property(nonatomic, retain) UIButton *mp_helpBtn;
//@property(nonatomic, retain) ZCGStat *mp_gameStat;
- (BOOL)InitStartScreen:(ZCGView *)p_startMainView;
- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType;
@end



















