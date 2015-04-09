//
//  ZCGUIMgr.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//


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


@interface ZCGUIMgr : NSObject
{
}
@property(nonatomic, retain) ZCGView *mp_mainViewContainer;
@property(nonatomic, retain) ZCGView *mp_startMainScreen;
@property(nonatomic, retain) ZCGView *mp_playMainScreen;
- (id)init:(ZCGView *)p_mainViewContainer;
- (void)InitGameUI:(ZCGView *)p_mainViewContainer;
- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType;
@end
