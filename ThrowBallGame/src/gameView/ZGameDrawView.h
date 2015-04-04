//
//  ZGameDrawView.h
//  ThrowBallGame
//
//  Created by zhu on 3/22/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "GameImageView.h"

// coordinate system transform
// context co-system converts to screen coordinate system
#define CO_SYSTEM_TRANSFORM(pointSrc) pointSrc.y = self.frame.size.height - pointSrc.y;


#ifndef PI
#define PI 3.141592653
#endif

#define GV_VECTOR_POINT CGPoint
#define GV_ARROW_ANGLE 30
#define GV_ARROW_LONG 14


@interface ZGameDrawView : GameImageView
{
    //the only image to display in this view object
    UIImage *m_pMainImage;
    
    // used for fuction DrawLineToPoint
    CGPoint m_startPoint;
    CGPoint m_endPoint;
    
    
    // line atribute varery define
    float m_fLineWidth;
    CGColorRef m_StrokeColorRef;
    float m_fLineLength;
    
    
    // store the frame of this view object
    CGRect m_rect;
}

///////////////////////////////////////////////////////////////////////////////////////////
// draw a line
// you can only invoke DrawLine fuction
// or you can invoke MoveToPoint and then call DrawLineToPoint to draw a line
- (void)DrawLine : (CGPoint)startPoint withEndPoint:(CGPoint)endPoint;
- (void)DrawLineToPoint : (CGPoint)pointSrc;
- (void)MoveToPoint : (CGPoint)pointSrc;

///////////////////////////////////////////////////////////////////////////////////////////
// draw a line with arrow
- (void)Get_Arrow_Point : (CGPoint *)p_point_1 with_return_point_2: (CGPoint *)p_point_2
             with_angle : (float)f_angle;
- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_ with_line_width : (float)_f_line_width_;
- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_line_width : (float)_f_line_width_ with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction;
- (void)Draw_Arrow_Line;

///////////////////////////////////////////////////////////////////////////////////////////
// set the line attribute
- (void)SetLineWidth : (float)fLineWidth;
- (void)SetStrokeColor : (CGColorRef)colorRef;

@end
