//
//  ZCGBackgroundMgr.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCGBackground.h"
#import "../gameView/ZCGView.h"
#import "../scene/ZCGField.h"

@interface ZCGBackgroundMgr : NSObject
{
    ZCGBackground *mp_background;
    ZCGView *mp_backgndContainer;
}
- (void)InitBackground:(ZCGView *)p_backgndContainer;
- (void)LoadScene:(const char *)strScene;




@end
