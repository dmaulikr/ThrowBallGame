//
//  ZCGView.m
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGView.h"

@implementation ZCGView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self EnableTouchEvent];
    }
    return self;
}

- (UIButton *)Add_Button : (NSString *)title with_frame : (CGRect)frame with_tag:(int)nTag with_index : (int)nIndex
{
    UIButton *p_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [p_button setFrame:frame];
    //[p_button setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    [p_button setTitle:title forState:UIControlStateNormal];
    p_button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [p_button.titleLabel setFont:[UIFont boldSystemFontOfSize:11]];
    [p_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [p_button setTag:nTag];
    [self insertSubview:p_button atIndex:nIndex];
    
    return p_button;
}

- (UILabel *)Add_Label : (NSString *)text with_frame : (CGRect)frame with_index : (int)nIndex
{
    UILabel *p = [[UILabel alloc] initWithFrame:frame];
    
    //[p setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [p setText:text];
    [p setTextColor:[UIColor blueColor]];
    [p setBackgroundColor:[UIColor clearColor]];
    
    [self insertSubview:p atIndex:nIndex];
    
    return p;
}


///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (m_bEnableTouchEvent == YES) {
        [super touchesBegan:touches withEvent:event];
    }
    return;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (m_bEnableTouchEvent == YES) {
        [super touchesCancelled:touches withEvent:event];
    }
    return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (m_bEnableTouchEvent == YES) {
        [super touchesEnded:touches withEvent:event];
    }
    return;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (m_bEnableTouchEvent == YES) {
        [super touchesMoved:touches withEvent:event];
    }
    return;
}

- (void)DisableTouchEvent
{
    m_bEnableTouchEvent = NO;
}

- (void)EnableTouchEvent
{
    m_bEnableTouchEvent = YES;
    
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
