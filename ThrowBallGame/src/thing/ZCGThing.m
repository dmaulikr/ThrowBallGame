//
//  ZCGThing.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGThing.h"

@implementation ZCGThing
@synthesize index = m_nIndex;
@synthesize owner = mp_owner;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        m_nIndex = 0;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


- (void)SetSize : (CGRect)rect
{
    self.frame =rect;
}

- (void)MoveToPoint : (CGPoint)point
{
    self.center = point;
}

- (void)MoveToThing : (ZCGThing *)p_dst
{
    [self removeFromSuperview];
    [p_dst ReceiveThing:self];
    self.owner = p_dst;
}

- (void)ReceiveThing : (ZCGThing *)p_src
{
    [self insertSubview:p_src atIndex:m_nIndex++];
}

- (void)LostThing
{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
