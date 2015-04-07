//
//  ZCGButton.m
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGButton.h"

@implementation ZCGButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)AddTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return;
}

+ (id)InitButton:(NSString *)title with_frame : (CGRect)frame with_tag : (int)nTag
{
    UIButton *p_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [p_button setFrame:frame];
    [p_button setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    [p_button setTitle:title forState:UIControlStateNormal];
    p_button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [p_button.titleLabel setFont:[UIFont boldSystemFontOfSize:11]];
    [p_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //[self insertSubview:p_button atIndex:nIndex];
    
    return p_button;
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
