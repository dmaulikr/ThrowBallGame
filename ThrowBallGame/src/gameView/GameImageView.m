//
//  GameImageView.m
//  ThrowBallGame
//
//  Created by zhu on 15-3-20.
//  Copyright (c) 2015年 zhu. All rights reserved.
//

#import "GameImageView.h"

@implementation GameImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    [self EnableTouchEvent];
    
    return self;
}

/**
 Leftforward axis X
 
 **/
- (void)InitBitmapContext
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    CGContextRef context = CGBitmapContextCreate(NULL, 200, 300, 8, 4 * 200, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    m_bitmapContextRef = context;
    
}

- (UIImage *)GetBimapFromBitmapContext
{
    CGImageRef imageMasked = CGBitmapContextCreateImage(m_bitmapContextRef);
    return [UIImage imageWithCGImage:imageMasked];
}

- (void)AddImage : (UIImage *)pImageSrc
{
    CGContextDrawImage(m_bitmapContextRef, self.frame, pImageSrc.CGImage);
    
    self.image = [self GetBimapFromBitmapContext];
}

- (void)AddImage : (UIImage *)pImageSrc withFrame : (CGRect)frame;
{
    CGContextDrawImage(m_bitmapContextRef, frame, pImageSrc.CGImage);
    
    self.image = [self GetBimapFromBitmapContext];
}

- (void)SetImage:(UIImage *)pImageSrc
{
    self.image = pImageSrc;
}


- (UIImage *)Get_Image_From_File : (NSString *)file_name
                       with_type : (NSString *)file_type
{
    NSString *p_file_path = [[NSBundle mainBundle] pathForResource:file_name ofType:file_type];
    NSData *imageData3 = [[NSData alloc] initWithContentsOfFile:p_file_path];
    UIImage* p_image = [[UIImage alloc] initWithData:imageData3];
    
    return p_image;
}

- (UIImage *)Get_Image_With_Rect : (UIImage *)p_image_src
                       with_rect : (CGRect)rect
{
    UIImage* p_new_image;
    
    UIGraphicsBeginImageContext(rect.size);
    //    // 绘制改变大小的图片
    [p_image_src drawInRect:rect];
    //    // 从当前context中创建一个改变大小后的图片
    p_new_image = UIGraphicsGetImageFromCurrentImageContext();
    //    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return p_new_image;
}


- (void)Display_Image : (UIImage *)p_image_src with_rect : (CGRect)rect
{
    UIGraphicsBeginImageContext(self.frame.size);
    //    // 绘制改变大小的图片
    [p_image_src drawInRect:rect];
    //    // 从当前context中创建一个改变大小后的图片
    UIImage* p_new_image = UIGraphicsGetImageFromCurrentImageContext();
    //    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    self.image = p_new_image;
}

- (UIImage *)Image_Rotation_Angle_90 : (UIImage *)p_image_src with_direction : (int)n_direction
{
    if (n_direction == BG_LEFT) {
        return [UIImage imageWithCGImage:p_image_src.CGImage scale:1 orientation:UIImageOrientationLeft];
    }
    
    return [UIImage imageWithCGImage:p_image_src.CGImage scale:1 orientation:UIImageOrientationRight];
}


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
