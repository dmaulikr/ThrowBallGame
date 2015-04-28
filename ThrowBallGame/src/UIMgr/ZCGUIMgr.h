//
//  ZCGUIMgr.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//


//

#import <Foundation/Foundation.h>
#import "UIMgrHeader.h"

@class ZCGView;
@class ZCGPlayScreenMgr;
@class ZCGStartScreenMgr;
@class ZCGStat;
@class ZCGThing;


@interface ZCGUIMgr : NSObject
{
    
}
@property(nonatomic, retain) ZCGView *mp_mainViewContainer;
@property(nonatomic, retain) ZCGView *mp_startMainScreen;
@property(nonatomic, retain) ZCGView *mp_playMainScreen;
@property(nonatomic, retain) ZCGPlayScreenMgr *mp_playScreenMgr;
@property(nonatomic, retain) ZCGStartScreenMgr *mp_startScreenMgr;
//@property(nonatomic, retain) ZCGStat *mp_gameStat;
- (id)init:(ZCGView *)p_mainViewContainer;
- (void)InitGameUI:(ZCGView *)p_mainViewContainer;
- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType;
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;
- (ZCGThing *)GetGameContainer;
- (void)SetGameStatistic:(ZCGStat *)p_stat;
- (void)GameStatusLabelMove;
- (void)SetNotifyInfo:(NSString *)pInfo;
@end
