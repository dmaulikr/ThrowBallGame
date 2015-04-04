//
//  Game_View.h
//  basketball_game
//
//  Created by zhu on 12/20/14.
//  Copyright (c) 2014 zhu. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#ifndef PI
#define PI 3.141592653
#endif


#define GV_NULL_DRAW_CMD 0
#define GV_LINE_DRAW_CMD 1
#define GV_ARROW_LINE_DRAW_CMD 2
#define GV_FILL_COLOR_CMD 3

#define GV_VECTOR_POINT CGPoint
#define GV_ARROW_ANGLE 30
#define GV_ARROW_LONG 14

@interface Game_View : UIView
{
    
    // save the drawed point
    
    
    CGPoint start_point;
    CGPoint end_point;
    
    float f_line_width;
    float f_line_long;
    
    CGColorRef color;
    CGRect rect;
    
    CGColorRef line_color;
    
    int n_draw_cmd;
    
    BOOL bEnableTouchEvent;
}

- (void)DisableTouchEvent;
- (void)EnableTouchEvent;

- (void)Set_Line_Long : (float)_f_line_long_;
- (float)Get_Line_Long;

- (void)Set_Line_Color : (CGColorRef)_line_color;
- (void)Draw_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_ with_line_width : (float)_f_line_width_;
- (void)Draw_Line : (CGPoint)_start_point_ with_line_width : (float)_f_line_width_ with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction;
- (void)Draw_Line;


- (void)Get_Arrow_Point : (CGPoint *)p_point_1 with_return_point_2: (CGPoint *)p_point_2
             with_angle : (float)f_angle;
- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_ with_line_width : (float)_f_line_width_;
- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_line_width : (float)_f_line_width_ with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction;
- (void)Draw_Arrow_Line;

- (void)Fill_Color : (CGColorRef)_color with_rect : (CGRect)_rect;
- (void)Fill_Color;


- (void)Clear_View_Content;



/**
 InitDraw
 add draw
 add another draw
 ........
 BeginDraw
 //
**/


@end


#define GameView Game_View






















