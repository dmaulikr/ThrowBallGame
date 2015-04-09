//
//  ZCGStartScreen.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZCGView;

#ifndef __TOUCH_EVENT_TYPE__
#define __TOUCH_EVENT_TYPE__
typedef enum _TOUCH_EVENT_TYPE_
{
    TOUCH_BEGAN_EVENT_TYPE = 0,
    TOUCH_MOVE_EVENT_TYPE = 1,
    TOUCH_END_EVENT_TYPE = 2,
}TOUCH_EVENT_TYPE;
#endif


#define BG_START_BUTTON_ID 0
#define BG_HELP_BUTTON_ID 1

@interface ZCGStartScreenMgr : NSObject
{
}
@property(nonatomic, retain) ZCGView *mp_startMainView;
- (BOOL)InitStartScreen:(ZCGView *)p_startMainView;
- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType;
@end



















