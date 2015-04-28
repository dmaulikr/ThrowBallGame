//
//  GameImageView.h
//  ThrowBallGame
//
//  Created by zhu on 15-3-20.
//  Copyright (c) 2015年 zhu. All rights reserved.
//


// ZCGImageView is a class which is used to implement the image usually process
// like: to read an imagge from file, to rotate an image for 90 degree ,etc.
// this class will be able to create a CGContecRef used
// to do some work on draw and paint.
// but there is no relavant draw methods have been realized now.
// this class is just made to read and display an image originally.



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

// clear what  have been drawed that displaying on the view
- (void)ClearDraw;


- (void)InitBitmapContext;
- (void)ReleaseBitmapContext;
- (UIImage *)GetBimapFromBitmapContext;

// add the content of the source image to the exist image
- (void)AddImage : (UIImage *)pImageSrc;
- (void)AddImage : (UIImage *)pImageSrc withFrame : (CGRect)frame;

// display an image in place of the exist image
- (void)SetImage:(UIImage *)pImageSrc;

// get the center point of the image view relative to
- (CGPoint)GetCenterPosition;

//====== photo processing methods================
// get an image
- (UIImage *)Get_Image_From_File : (NSString *)file_name
                       with_type : (NSString *)file_type;

// get an resized image of the source image
// the source image will not be modified
// the goal size is the element size of the parameter rect
- (UIImage *)Get_Image_With_Rect : (UIImage *)p_image_src
                       with_rect : (CGRect)rect;

// display the specified image
- (void)Display_Image : (UIImage *)p_image_src
            with_rect : (CGRect)rect;

// this is a class method
// use the source image to create an rotated image and return it
+ (UIImage *)Image_Rotation_Angle_90 : (UIImage *)p_image_src with_direction : (int)n_direction;


// make the self image of the image view rotated 90 degree
- (void)Image_Rotation_Angle_90:(int)n_direction;

//- (void)Output;

@end



