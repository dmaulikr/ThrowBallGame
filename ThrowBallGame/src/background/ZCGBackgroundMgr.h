//
//  ZCGBackgroundMgr.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZCGBackground;

@interface ZCGBackgroundMgr : NSObject
{
}
@property(nonatomic,retain) ZCGBackground *mp_background;
- (void)InitBackground:(ZCGBackground *)p_backgnd;
- (void)LoadScene:(const char *)strScene;




@end
