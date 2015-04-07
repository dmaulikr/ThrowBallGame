//
//  ZCGStartScreen.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "../gameView/ZCGView.h"

@interface ZCGStartScreenMgr : NSObject
{
    ZCGView *mp_startMainView;
    
    UIButton *mp_startBtn;
    UIButton *mp_helpBtn;
}
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;
- (BOOL)InitStartScreen:(ZCGView *)p_startMainView;

@end



















