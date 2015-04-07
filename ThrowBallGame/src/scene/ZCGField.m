//
//  ZCGField.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGField.h"

@implementation ZCGField

+ (void)LoadField:(ZCGBackground *)p_backgnd
{    
    UIImage *p_image = [p_backgnd Get_Image_From_File:@"yewai" with_type:@"jpg"];
    [p_backgnd SetImage:p_image];
    [p_backgnd Image_Rotation_Angle_90:BG_RIGHT];

    CGRect frame = CGRectMake(20, 300, 300, 150);
    ZCGTree *p_tree = [[ZCGTree alloc] initWithFrame:frame];
    [p_tree Image_Rotation_Angle_90:BG_RIGHT];
    [p_backgnd AddMovingThing:p_tree withFrame:p_tree.frame];
    
   //[p_backgnd Image_Rotation_Angle_90:BG_RIGHT];
    
    return;
}


@end
