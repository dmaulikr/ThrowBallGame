//
//  ZCGBackground.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGBackground.h"

@implementation ZCGBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        m_nIndex = 0;
    }
    return self;
}

- (void)AddMovingThing:(ZCGThing *)p_thing withFrame:(CGRect)frame
{
    //[self AddImage:p_thing.image withFrame:frame];
    [self insertSubview:p_thing atIndex:m_nIndex++];
}

- (void)AddQuietThing:(ZCGThing *)p_thing withFrame:(CGRect)frame
{
    [self AddImage:p_thing.image withFrame:frame];
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
