//
//  GameImageView.h
//  ThrowBallGame
//
//  Created by zhu on 15-3-20.
//  Copyright (c) 2015年 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BG_LEFT 0
#define BG_RIGHT 1


@interface ZCGImageView : UIImageView
{
    BOOL m_bEnableTouchEvent;
    
    CGContextRef m_bitmapContextRef;
}

//@property int m_nText;
- (void)DisableTouchEvent;
- (void)EnableTouchEvent;

- (void)InitBitmapContext;
- (void)ReleaseBitmapContext;
- (UIImage *)GetBimapFromBitmapContext;
// add an image to the exist image
- (void)AddImage : (UIImage *)pImageSrc;
- (void)AddImage : (UIImage *)pImageSrc withFrame : (CGRect)frame;
// display an image
- (void)SetImage:(UIImage *)pImageSrc;

- (CGPoint)GetCenterPosition;

// photo processing methods
// bu shi cai jian  shi suo fang
- (UIImage *)Get_Image_From_File : (NSString *)file_name
                       with_type : (NSString *)file_type;
- (UIImage *)Get_Image_With_Rect : (UIImage *)p_image_src
                       with_rect : (CGRect)rect;
- (void)Display_Image : (UIImage *)p_image_src
            with_rect : (CGRect)rect;
+ (UIImage *)Image_Rotation_Angle_90 : (UIImage *)p_image_src with_direction : (int)n_direction;
- (void)Image_Rotation_Angle_90:(int)n_direction;

//- (void)Output;

@end
