//
//  ZCGThing.h
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//


// class thing
// the super class of ball, hole, tree etc.
// as a thing, it can receive other things and it can move to other thing


#import "../gameView/ZCGImageView.h"

@interface ZCGThing : ZCGImageView
{
    int m_nIndex;
    ZCGThing *mp_owner;
}
@property(assign) int index;
@property(nonatomic, retain)ZCGThing *owner;
- (void)SetSize : (CGRect)rect;
- (void)MoveToPoint : (CGPoint)point;
- (void)MoveToThing : (ZCGThing *)p_dst;
- (void)ReceiveThing : (ZCGThing *)p_src;
- (void)LostThing;
@end
