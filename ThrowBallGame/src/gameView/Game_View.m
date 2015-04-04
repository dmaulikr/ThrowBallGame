//
//  Game_View.m
//  basketball_game
//
//  Created by zhu on 12/20/14.
//  Copyright (c) 2014 zhu. All rights reserved.
//

#import "Game_View.h"

@implementation Game_View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    n_draw_cmd = 0;
    f_line_long = 14;
    line_color = [UIColor blackColor].CGColor;
    
    bEnableTouchEvent = YES;
    
    return self;
}

- (void)Set_Line_Long : (float)_f_line_long_
{
    f_line_long = _f_line_long_;
}

- (float)Get_Line_Long
{
    return f_line_long;
}

- (void)drawRect:(CGRect)rect
{
    switch (n_draw_cmd) {
        case GV_LINE_DRAW_CMD:
            [self Draw_Line];
            break;
        case GV_ARROW_LINE_DRAW_CMD:
            [self Draw_Arrow_Line];
            break;
        case GV_FILL_COLOR_CMD:
            [self Fill_Color];
            break;
            
        default:
            break;
    }
    
    n_draw_cmd = GV_NULL_DRAW_CMD;
    
    return;
}

- (void)Set_Line_Color : (CGColorRef)_line_color
{
    line_color = _line_color;
}

- (void)Clear_View_Content
{
    [self setNeedsDisplay];
}


- (void)Fill_Color
{
    CGContextRef context    =UIGraphicsGetCurrentContext();//获取画布
    CGContextSetFillColorWithColor(context, color);
    CGContextFillRect(context, rect);
    CGContextStrokePath(context);//结束，也就是开始画
    
    return;
}

- (void)Fill_Color : (CGColorRef)_color with_rect : (CGRect)_rect
{
    color = _color;
    rect = _rect;
    n_draw_cmd = GV_FILL_COLOR_CMD;
    
    [self setNeedsDisplay];
    
    return;
}


- (void)Draw_Line
{
    CGContextRef context    =UIGraphicsGetCurrentContext();//获取画布
    CGContextSetStrokeColorWithColor(context, line_color);//线条颜色
    CGContextSetShouldAntialias(context,NO);//设置线条平滑，不需要两边像素宽
    CGContextSetLineWidth(context,f_line_width);//设置线条宽度
    CGContextMoveToPoint(context,start_point.x,start_point.y); //线条起始点
    CGContextAddLineToPoint(context,end_point.x,end_point.y);//线条结束点
    
    CGContextStrokePath(context);//结束，也就是开始画
    
}

- (void)Draw_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_ with_line_width : (float)_f_line_width_
{
    start_point = _start_point_;
    end_point = _end_point_;
    f_line_width = _f_line_width_;
    n_draw_cmd = GV_LINE_DRAW_CMD;
    [self setNeedsDisplay];
}

- (void)Draw_Line : (CGPoint)_start_point_ with_line_width : (float)_f_line_width_ with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction
{
    start_point = _start_point_;
    
    f_line_direction = PI / 2 - f_line_direction * PI / 180;
    end_point.x = start_point.x + _f_line_long_ * cos(f_line_direction);
    end_point.y = start_point.y + _f_line_long_ * sin(f_line_direction);
    
    f_line_width = _f_line_width_;
    f_line_long = _f_line_long_;
    n_draw_cmd = GV_LINE_DRAW_CMD;
    [self setNeedsDisplay];
}

- (void)Draw_Arrow_Line
{
    CGPoint point_1, point_2;
    
    CGContextRef context    =UIGraphicsGetCurrentContext();//获取画布
    CGContextSetStrokeColorWithColor(context, line_color);//线条颜色
    CGContextSetShouldAntialias(context,NO);//设置线条平滑，不需要两边像素宽
    CGContextSetLineWidth(context,f_line_width);//设置线条宽度
    CGContextMoveToPoint(context,start_point.x,start_point.y); //线条起始点
    CGContextAddLineToPoint(context,end_point.x,end_point.y);//线条结束点
    // draw arrow
    [self Get_Arrow_Point:&point_1 with_return_point_2:&point_2 with_angle:GV_ARROW_ANGLE];
    CGContextMoveToPoint(context,point_1.x,point_1.y); //线条起始点
    CGContextAddLineToPoint(context,end_point.x,end_point.y);//线条结束点
    CGContextMoveToPoint(context,point_2.x,point_2.y); //线条起始点
    CGContextAddLineToPoint(context,end_point.x,end_point.y);//线条结束点
    
    CGContextStrokePath(context);//结束，也就是开始画
}

- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_ with_line_width : (float)_f_line_width_
{
    start_point = _start_point_;
    end_point = _end_point_;
    f_line_width = _f_line_width_;
    n_draw_cmd = GV_ARROW_LINE_DRAW_CMD;
    [self setNeedsDisplay];
}

- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_line_width : (float)_f_line_width_ with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction
{

    start_point = _start_point_;
    
    f_line_direction = PI / 2 - f_line_direction * PI / 180;
    end_point.x = start_point.x + _f_line_long_ * cos(f_line_direction);
    end_point.y = start_point.y + _f_line_long_ * sin(f_line_direction);
    
    f_line_width = _f_line_width_;
    f_line_long = _f_line_long_;
    n_draw_cmd = GV_ARROW_LINE_DRAW_CMD;
    [self setNeedsDisplay];
}

- (void)Get_Arrow_Point : (CGPoint *)p_point_1 with_return_point_2: (CGPoint *)p_point_2
             with_angle : (float)f_angle
{
    CGPoint point_A = start_point;
    CGPoint point_B = end_point;
    CGPoint vector_AB;
    float f_abs_CB = GV_ARROW_LONG;
    float f_angle_AB;
    float delta_x_1;
    float delta_y_1;
    float delta_y_2;
    float delta_x_2;
    
    
    if (point_A.y == point_B.y)
    {
        point_B.y += 1;
    }
    
    if (point_A.x == point_B.x)
    {
        point_B.x += 1;
    }
    
    vector_AB = CGPointMake(point_B.x - point_A.x, point_B.y - point_A.y);
    
    
    f_angle_AB = atan(vector_AB.y / vector_AB.x);
    f_angle = f_angle * PI / 180;
    
    delta_x_1 = f_abs_CB * cos(f_angle_AB - f_angle);
    delta_y_1 = f_abs_CB * sin(f_angle_AB - f_angle);
    
    delta_y_2 = f_abs_CB * cos(PI / 2 - f_angle_AB - f_angle);
    delta_x_2 = f_abs_CB * sin(PI / 2 - f_angle_AB - f_angle);
    
    if (f_angle_AB >= 0)
    {
        p_point_1->x = point_B.x - delta_x_1;
        p_point_1->y = point_B.y - delta_y_1;
        
        p_point_2->x = point_B.x - delta_x_2;
        p_point_2->y = point_B.y - delta_y_2;
    }
    else
    {
        p_point_1->x = point_B.x + delta_x_1;
        p_point_1->y = point_B.y + delta_y_1;
        
        p_point_2->x = point_B.x + delta_x_2;
        p_point_2->y = point_B.y + delta_y_2;
    }
    
    return;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (bEnableTouchEvent == YES) {
        [super touchesBegan:touches withEvent:event];
    }
    return;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (bEnableTouchEvent == YES) {
        [super touchesCancelled:touches withEvent:event];
    }
    return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (bEnableTouchEvent == YES) {
        [super touchesEnded:touches withEvent:event];
    }
    return;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (bEnableTouchEvent == YES) {
        [super touchesMoved:touches withEvent:event];
    }
    return;
}

- (void)DisableTouchEvent
{
    bEnableTouchEvent = NO;
}

- (void)EnableTouchEvent
{
    bEnableTouchEvent = YES;
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
