//
//  GameImageView.m
//  ThrowBallGame
//
//  Created by zhu on 15-3-20.
//  Copyright (c) 2015年 zhu. All rights reserved.
//

#import "ZCGImageView.h"

@implementation ZCGImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        m_bitmapContextRef = nil;
        
        [self EnableTouchEvent];
    }
    
    return self;
}

//- (void)Output
//{
//    NSLog(@"ZCGImageView: Output\n");
//}
/**
 Leftforward axis X
 
 **/
- (void)InitBitmapContext
{
    if (m_bitmapContextRef != nil) {
        return;
    }
    
    int nWidth = self.frame.size.width;
    int nHeight = self.frame.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    //CGContextRef context = CGBitmapContextCreate(NULL, 200, 300, 8, 4 * 200, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextRef context = CGBitmapContextCreate(NULL, nWidth, nHeight, 8, 4 * nWidth, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    m_bitmapContextRef = context;
}

- (void)ReleaseBitmapContext
{
    if (m_bitmapContextRef == nil) {
        return;
    }
    
    CGContextRelease(m_bitmapContextRef);
    m_bitmapContextRef = nil;
}


- (UIImage *)GetBimapFromBitmapContext
{
    CGImageRef imageMasked = CGBitmapContextCreateImage(m_bitmapContextRef);
    return [UIImage imageWithCGImage:imageMasked];
}

- (void)AddImage : (UIImage *)pImageSrc
{
    self.image = pImageSrc;
}

- (void)AddImage : (UIImage *)pImageSrc withFrame : (CGRect)frame;
{
    [self InitBitmapContext];
    CGContextDrawImage(m_bitmapContextRef, self.frame, self.image.CGImage);
    CGContextDrawImage(m_bitmapContextRef, frame, pImageSrc.CGImage);
    self.image = [self GetBimapFromBitmapContext];
    //self.image = [self Image_Rotation_Angle_90:self.image with_direction:BG_RIGHT];

    [self ReleaseBitmapContext];
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
    [p_image_src drawInRect:rect];
    p_new_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return p_new_image;
}


- (void)Display_Image : (UIImage *)p_image_src with_rect : (CGRect)rect
{
    UIGraphicsBeginImageContext(self.frame.size);
    //  draw the image in the specified rect
    [p_image_src drawInRect:rect];
    UIImage* p_new_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.image = p_new_image;
}


- (void)ClearDraw
{
    UIGraphicsBeginImageContext(self.image.size);
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return;
}


+ (UIImage *)Image_Rotation_Angle_90 : (UIImage *)p_image_src with_direction : (int)n_direction
{
    if (n_direction == BG_LEFT) {
        return [UIImage imageWithCGImage:p_image_src.CGImage scale:1 orientation:UIImageOrientationLeft];
    }
    
    return [UIImage imageWithCGImage:p_image_src.CGImage scale:1 orientation:UIImageOrientationRight];
}

- (void)Image_Rotation_Angle_90:(int)n_direction
{
    
    if (n_direction == BG_LEFT) {
        self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationLeft];
    }
    
    self.image = [UIImage imageWithCGImage:self.image.CGImage scale:1 orientation:UIImageOrientationRight];
    
    return;
}


- (CGPoint)GetCenterPosition
{
    return self.center;
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
    self.userInteractionEnabled = NO;
}

- (void)EnableTouchEvent
{
    m_bEnableTouchEvent = YES;
    self.userInteractionEnabled = YES;
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
