//
//  ZCGUIMgr.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//


//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "../gameView/ZCGView.h"
#import "ZCGPlayScreenMgr.h"
#import "ZCGStartScreenMgr.h"
#import "ZCGBackgroundMgr.h"

@interface ZCGUIMgr : NSObject
{
    ZCGView *mp_mainViewContainer;
    
    ZCGView *mp_startMainScreen;
    ZCGView *mp_playMainScreen;
    
    ZCGBackground *mp_backgnd;
    ZCGBackgroundMgr *mp_backgndMgr;
    
    
    ZCGPlayScreenMgr *mp_playScreenMgr;
    ZCGStartScreenMgr *mp_startScreenMgr;
}
- (id)init:(ZCGView *)p_mainViewContainer;
- (void)InitGameUI:(ZCGView *)p_mainViewContainer;

@end
