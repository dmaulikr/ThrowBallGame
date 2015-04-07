//
//  ZCGBackground.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//
#import "../thing/ZCGThing.h"

@interface ZCGBackground : ZCGThing
{
    int m_nIndex;
}
- (void)AddQuietThing:(ZCGThing *)p_thing withFrame:(CGRect)frame;
- (void)AddMovingThing:(ZCGThing *)p_thing withFrame:(CGRect)frame;
- (void)LoadScene:(const char *)strScene;

@end
