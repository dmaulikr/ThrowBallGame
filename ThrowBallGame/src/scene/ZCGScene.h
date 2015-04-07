//
//  ZCGScene.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZCGBackground;

@interface ZCGScene : NSObject
{
}
- (void)LoadScene:(const char *)strScene;
+ (void)LoadScene:(ZCGBackground *)p_backgnd;


@end
