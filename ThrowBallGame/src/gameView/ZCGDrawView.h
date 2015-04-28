//
//  ZGameDrawView.h
//  ThrowBallGame
//
//  Created by zhu on 3/22/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGImageView.h"

// coordinate system transform
// context co-system converts to screen coordinate system
#define CO_SYSTEM_TRANSFORM(pointSrc) pointSrc.y = self.frame.size.height - pointSrc.y;


#ifndef PI
#define PI 3.141592653
#endif

#define GV_VECTOR_POINT CGPoint
#define GV_ARROW_ANGLE 30
#define GV_ARROW_LONG 14


@interface ZCGDrawView : ZCGImageView
{
    //the only image to display in this view object
    UIImage *m_pMainImage;
    
    // used for fuction DrawLineToPoint
    CGPoint m_startPoint;
    CGPoint m_endPoint;
    CGPoint m_arrowPoint1, m_arrowPoint2;
    
    
    // line atribute varery define
    float m_fLineWidth;
    float m_fLineLength;
    CGColorRef m_StrokeColorRef;
    
    
    // store the frame of this view object
    CGRect m_rect;
}
@property(nonatomic, retain) UIImage *m_pMainImage;

// allow the draw fuctionality
// if you call this fuchtion then you can draw
- (void)EnableDrawFunction;
// forbid the draw fuctionality
// if you call this fuchtion then you can not draw
- (void)DisableDrawFunction;

// clear what  have been drawed that displaying on the view
- (void)ClearDraw;

// make the line or arrow line symmetric about the X Axis
// this method should not be used by user currently.
// it will be called by the draw line or arrow line function
- (void)SetToXAxisSymmetric;

///////////////////////////////////////////////////////////////////////////////////////////
// draw a line
// you can only invoke DrawLine fuction
// or you can invoke MoveToPoint and then call DrawAddLineToPoint to draw a line
- (void)DrawLine : (CGPoint)startPoint withEndPoint:(CGPoint)endPoint;
- (void)DrawLine : (CGPoint)_start_point_ withLineLong:(float)_f_line_long_ withLineDirectionDeg : (float)f_line_direction;
- (void)DrawAddLineToPoint : (CGPoint)pointSrc;
- (void)DrawMoveToPoint : (CGPoint)pointSrc;

///////////////////////////////////////////////////////////////////////////////////////////
// draw a line with arrow
- (void)Get_Arrow_Point : (CGPoint *)p_point_1 with_return_point_2: (CGPoint *)p_point_2
             with_angle : (float)f_angle;
- (void)Compute_Arrow_Point;
- (void)Draw_Arrow_Line;
// you can use each of the follow two member fuction to draw a line with arrow
- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_;
- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction;


///////////////////////////////////////////////////////////////////////////////////////////
// set the line attribute
- (void)SetLineWidth : (float)fLineWidth;
- (void)SetStrokeColor : (CGColorRef)colorRef;

- (float)Deg2Rad:(float)fDeg;
- (float)Rad2Deg:(float)fRad;

@end
