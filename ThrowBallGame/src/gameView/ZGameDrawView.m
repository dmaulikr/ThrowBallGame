//
//  ZGameDrawView.m
//  ThrowBallGame
//
//  Created by zhu on 3/22/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZGameDrawView.h"

@implementation ZGameDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    
    m_rect = frame;
    m_pMainImage = nil;
    
    m_fLineWidth = 3;
    m_StrokeColorRef = [UIColor blackColor].CGColor;
    m_fLineLength = 100;
    
    [self EnableTouchEvent];
    
    [self InitBitmapContext];
    
    return self;
}

- (void)InitBitmapContext
{
    int nWidth = self.frame.size.width;
    int nHeight = self.frame.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    CGContextRef context = CGBitmapContextCreate(NULL, nWidth, nHeight, 8, 4 * nWidth, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 3);
    
    if (m_pMainImage == nil) {
        m_pMainImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    }
    else
    {
        //CGContextDrawImage(context, self.frame, m_pMainImage.CGImage);
    }
    m_bitmapContextRef = context;
}

//- (UIImage *)GetBimapFromBitmapContext
//{
//    CGImageRef imageMasked = CGBitmapContextCreateImage(m_bitmapContextRef);
//    return [UIImage imageWithCGImage:imageMasked];
//}

//- (void)AddImage : (UIImage *)pImageSrc
//{
//    m_pMainImage = pImageSrc;
//    self.image = pImageSrc;
//}

- (void)SetImage : (UIImage *)pImageSrc
{
    m_pMainImage = pImageSrc;
    self.image = pImageSrc;
}

- (void)DrawLine : (CGPoint)startPoint withEndPoint:(CGPoint)endPoint
{
    CO_SYSTEM_TRANSFORM(startPoint);
    CO_SYSTEM_TRANSFORM(endPoint);
    
    CGContextMoveToPoint(m_bitmapContextRef, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(m_bitmapContextRef, endPoint.x, endPoint.y);
    CGContextStrokePath(m_bitmapContextRef);
    
    [self SetImage:[self GetBimapFromBitmapContext]];
}


- (void)DrawLineToPoint : (CGPoint)pointSrc
{
    m_endPoint = pointSrc;
    [self DrawLine:m_startPoint withEndPoint:m_endPoint];
}

- (void)MoveToPoint : (CGPoint)pointSrc
{
    m_startPoint = pointSrc;
}


- (void)Draw_Arrow_Line
{
    CGPoint point_1, point_2;
    
    CGContextSetStrokeColorWithColor(m_bitmapContextRef, m_StrokeColorRef);//线条颜色
    CGContextSetShouldAntialias(m_bitmapContextRef,NO);//设置线条平滑，不需要两边像素宽
    CGContextSetLineWidth(m_bitmapContextRef,m_fLineWidth);//设置线条宽度
    CGContextMoveToPoint(m_bitmapContextRef,m_startPoint.x,m_startPoint.y); //线条起始点
    CGContextAddLineToPoint(m_bitmapContextRef,m_endPoint.x,m_endPoint.y);//线条结束点
    // draw arrow
    [self Get_Arrow_Point:&point_1 with_return_point_2:&point_2 with_angle:GV_ARROW_ANGLE];
    //CO_SYSTEM_TRANSFORM(point_1);
    //CO_SYSTEM_TRANSFORM(point_2);
    
    CGContextMoveToPoint(m_bitmapContextRef,point_1.x,point_1.y); //线条起始点
    CGContextAddLineToPoint(m_bitmapContextRef,m_endPoint.x,m_endPoint.y);//线条结束点
    CGContextMoveToPoint(m_bitmapContextRef,point_2.x,point_2.y); //线条起始点
    CGContextAddLineToPoint(m_bitmapContextRef,m_endPoint.x,m_endPoint.y);//线条结束点
    
    CGContextStrokePath(m_bitmapContextRef);//结束，也就是开始画
    
    [self SetImage:[self GetBimapFromBitmapContext]];
}

- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_ with_line_width : (float)_f_line_width_
{
    m_startPoint = _start_point_;
    m_endPoint = _end_point_;
    m_fLineWidth = _f_line_width_;
    
    CO_SYSTEM_TRANSFORM(m_startPoint);
    CO_SYSTEM_TRANSFORM(m_endPoint);
    
    [self Draw_Arrow_Line];
}

- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_line_width : (float)_f_line_width_ with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction
{
    
    m_startPoint = _start_point_;
    
    f_line_direction = M_PI / 2 - f_line_direction * M_PI / 180;
    m_endPoint.x = m_startPoint.x + _f_line_long_ * cos(f_line_direction);
    m_endPoint.y = m_startPoint.y + _f_line_long_ * sin(f_line_direction);
    
    m_fLineWidth = _f_line_width_;
    m_fLineLength = _f_line_long_;
    
    CO_SYSTEM_TRANSFORM(m_startPoint);
    CO_SYSTEM_TRANSFORM(m_endPoint);
    
    
    [self Draw_Arrow_Line];
}

- (void)Get_Arrow_Point : (CGPoint *)p_point_1 with_return_point_2: (CGPoint *)p_point_2
             with_angle : (float)f_angle
{
    CGPoint point_A = m_startPoint;
    CGPoint point_B = m_endPoint;
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
    f_angle = f_angle * M_PI / 180;
    
    delta_x_1 = f_abs_CB * cos(f_angle_AB - f_angle);
    delta_y_1 = f_abs_CB * sin(f_angle_AB - f_angle);
    
    delta_y_2 = f_abs_CB * cos(M_PI / 2 - f_angle_AB - f_angle);
    delta_x_2 = f_abs_CB * sin(M_PI / 2 - f_angle_AB - f_angle);
    
    p_point_1->x = point_B.x - delta_x_1;
    p_point_1->y = point_B.y - delta_y_1;
    
    p_point_2->x = point_B.x - delta_x_2;
    p_point_2->y = point_B.y - delta_y_2;
    
    return;
}



- (void)SetLineWidth : (float)fLineWidth
{
    m_fLineWidth = fLineWidth;
    CGContextSetLineWidth(m_bitmapContextRef, fLineWidth);
}

- (void)SetStrokeColor : (CGColorRef)colorRef
{
    m_StrokeColorRef = colorRef;
    CGContextSetStrokeColorWithColor(m_bitmapContextRef, colorRef);
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
