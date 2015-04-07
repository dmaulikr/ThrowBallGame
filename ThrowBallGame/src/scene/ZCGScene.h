//
//  ZCGScene.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../UIMgr/ZCGBackground.h"

@interface ZCGScene : NSObject
{
    ZCGBackground *mp_backgnd;
}
- (void)InitScene:(ZCGBackground *)p_backgnd;
- (void)LoadScene:(const char *)strScene;


@end
