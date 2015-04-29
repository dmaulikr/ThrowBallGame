//
//  ZGameDrawView.m
//  ThrowBallGame
//
//  Created by zhu on 3/22/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGDrawView.h"
#import <math.h>


@implementation ZCGDrawView
@synthesize m_pMainImage;

- (void)dealloc
{
    [m_pMainImage release];
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        m_rect = frame;
        self.m_pMainImage = nil;
        
        m_fLineWidth = 3;
        m_StrokeColorRef = [UIColor blackColor].CGColor;
        m_fLineLength = 100;
        
        m_bitmapContextRef = nil;
        
        [self InitBitmapContext];
    }
    
    //int n = self.m_nText;
    
    return self;
}

//- (void)Output
//{
//    NSLog(@"ZCGDrawView: Output\n");
//}


- (void)ClearDraw
{    
    //CGContextDrawImage(m_bitmapContextRef, self.frame, m_pMainImage.CGImage);
    CGContextClearRect(m_bitmapContextRef, self.frame);
    [self SetImage:[self GetBimapFromBitmapContext]];
    
    return;
}

- (void)EnableDrawFunction
{
    [self InitBitmapContext];
}

- (void)DisableDrawFunction
{
    [self ReleaseBitmapContext];
}

- (void)InitBitmapContext
{
    int nWidth = self.frame.size.width;
    int nHeight = self.frame.size.height;
    
    if (m_bitmapContextRef != nil) {
        return;
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    CGContextRef context = CGBitmapContextCreate(NULL, nWidth, nHeight, 8, 4 * nWidth, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 3);
    
    if (m_pMainImage == nil) {
        self.m_pMainImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    }
    else
    {
        //CGContextDrawImage(context, self.frame, m_pMainImage.CGImage);
    }
    m_bitmapContextRef = context;
}

- (void)AddImage : (UIImage *)pImageSrc withFrame : (CGRect)frame;
{
    CGContextDrawImage(m_bitmapContextRef, frame, pImageSrc.CGImage);
    
    self.image = [self GetBimapFromBitmapContext];// invoked many times will leak memory?
}

- (void)SetImage : (UIImage *)pImageSrc
{
    self.m_pMainImage = pImageSrc;
    self.image = pImageSrc;
}

- (float)Deg2Rad:(float)fDeg
{
    return (fDeg * M_PI / 180.0);
}

- (float)Rad2Deg:(float)fRad
{
    return (fRad * 180.0 / M_PI);
}



- (void)DrawLine : (CGPoint)startPoint withEndPoint:(CGPoint)endPoint
{
    CO_SYSTEM_TRANSFORM(startPoint);
    CO_SYSTEM_TRANSFORM(endPoint);
    
    CGContextSetShouldAntialias(m_bitmapContextRef,NO);//set the stroke smooth
    CGContextMoveToPoint(m_bitmapContextRef, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(m_bitmapContextRef, endPoint.x, endPoint.y);
    CGContextStrokePath(m_bitmapContextRef);
    
    [self SetImage:[self GetBimapFromBitmapContext]];
}

- (void)DrawLine : (CGPoint)_start_point_ withLineLong:(float)_f_line_long_ withLineDirectionDeg : (float)f_line_direction
{
    CGPoint end_point;
    CGPoint start_point;
    
    start_point = _start_point_;
    
    f_line_direction = PI / 2 - f_line_direction * PI / 180;
    end_point.x = start_point.x + _f_line_long_ * cos(f_line_direction);
    end_point.y = start_point.y + _f_line_long_ * sin(f_line_direction);
    
    [self DrawLine:start_point withEndPoint:end_point];
    
    return;
}


- (void)DrawAddLineToPoint : (CGPoint)pointSrc
{
    m_endPoint = pointSrc;
    [self DrawLine:m_startPoint withEndPoint:m_endPoint];
}

- (void)DrawMoveToPoint : (CGPoint)pointSrc
{
    m_startPoint = pointSrc;
}


- (void)Draw_Arrow_Line
{
    //CGPoint point_1, point_2;
    
    CGContextSetStrokeColorWithColor(m_bitmapContextRef, m_StrokeColorRef);
    CGContextSetShouldAntialias(m_bitmapContextRef,NO);
    CGContextSetLineWidth(m_bitmapContextRef,m_fLineWidth);
    CGContextMoveToPoint(m_bitmapContextRef,m_startPoint.x,m_startPoint.y); 
    CGContextAddLineToPoint(m_bitmapContextRef,m_endPoint.x,m_endPoint.y);
    // draw arrow
    //CO_SYSTEM_TRANSFORM(point_1);
    //CO_SYSTEM_TRANSFORM(point_2);
    //[self Get_Arrow_Point:&point_1 with_return_point_2:&point_2 with_angle:GV_ARROW_ANGLE];
    //CO_SYSTEM_TRANSFORM(point_1);
    //CO_SYSTEM_TRANSFORM(point_2);
    
    CGContextMoveToPoint(m_bitmapContextRef,m_arrowPoint1.x,m_arrowPoint1.y); 
    CGContextAddLineToPoint(m_bitmapContextRef,m_endPoint.x,m_endPoint.y);
    CGContextMoveToPoint(m_bitmapContextRef,m_arrowPoint2.x,m_arrowPoint2.y);
    CGContextAddLineToPoint(m_bitmapContextRef,m_endPoint.x,m_endPoint.y);
    
    CGContextStrokePath(m_bitmapContextRef);
    
    [self SetImage:[self GetBimapFromBitmapContext]];
}

- (void)Draw_Arrow_Line : (CGPoint)_start_point_ with_end_point:(CGPoint)_end_point_
{
    m_startPoint = _start_point_;
    m_endPoint = _end_point_;
    //m_fLineWidth = _f_line_width_;
    
    float x1 = m_startPoint.x - m_endPoint.x;
    float y1 = m_startPoint.y - m_endPoint.y;
    float fAngleDeg;
    float fLineLong;
    
    fAngleDeg = y1 == 0 ? 0 : atanf(x1 / y1);
    fAngleDeg = [self Rad2Deg:fAngleDeg];
    x1 *= x1;
    y1 *= y1;
    fLineLong = sqrtf(x1 + y1);
     
    
    //CO_SYSTEM_TRANSFORM(m_startPoint);
    //CO_SYSTEM_TRANSFORM(m_endPoint);
    [self Draw_Arrow_Line:m_startPoint with_line_long:fLineLong with_line_direction:fAngleDeg];
    
    return;
}

- (void)Draw_Arrow_Line : (CGPoint)_start_point_  with_line_long:(float)_f_line_long_ with_line_direction : (float)f_line_direction
{
    
    float fAngleTempDeg = f_line_direction;
    
    f_line_direction = fabsf(f_line_direction);
    
    m_startPoint = _start_point_;
    
    f_line_direction = M_PI / 2 - f_line_direction * M_PI / 180;
    m_endPoint.x = m_startPoint.x + _f_line_long_ * cos(f_line_direction);
    m_endPoint.y = m_startPoint.y + _f_line_long_ * sin(f_line_direction);
    
    //m_fLineWidth = _f_line_width_;
    m_fLineLength = _f_line_long_;
    
    CO_SYSTEM_TRANSFORM(m_startPoint);
    CO_SYSTEM_TRANSFORM(m_endPoint);

    [self Compute_Arrow_Point];
    
    if (fAngleTempDeg < 0 ) {
        [self SetToXAxisSymmetric];
    }
    
    [self Draw_Arrow_Line];
}

- (void)SetToXAxisSymmetric
{
    float fTemp = m_startPoint.x + m_startPoint.x;
    
    m_endPoint.x = fTemp - m_endPoint.x;
    m_arrowPoint1.x = fTemp - m_arrowPoint1.x;
    m_arrowPoint2.x = fTemp - m_arrowPoint2.x;
    
}

- (void)Compute_Arrow_Point
{
    [self Get_Arrow_Point:&m_arrowPoint1 with_return_point_2:&m_arrowPoint2 with_angle:GV_ARROW_ANGLE];
}

// vector algorithm
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
