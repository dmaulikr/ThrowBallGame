//
//  ZCGameBasket.m
//  ThrowBallGame
//
//  Created by zhu on 4/2/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGameBasket.h"

@implementation ZCGameBasket

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        mp_gameBall = nil;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}

- (void)InitBasket
{
    UIImage *p_image;
    CGPoint point;
    CGRect basketRect = self.frame;
    
    m_nContainerIndex = 0;
    
    
    //mp_containerView = [[UIView alloc] initWithFrame:basketRect];
    mp_basketEntireImageView = [[ZCGameImageView alloc] initWithFrame:basketRect];
    mp_basketSectionImageView = [[ZCGameImageView alloc] initWithFrame:basketRect];
    
    //[mp_containerView setBackgroundColor:[UIColor clearColor]];
    [mp_basketEntireImageView setBackgroundColor:[UIColor clearColor]];
    [mp_basketSectionImageView setBackgroundColor:[UIColor clearColor]];
    
    [self insertSubview:mp_basketEntireImageView atIndex:m_nContainerIndex++];
    [self insertSubview:mp_basketSectionImageView atIndex:m_nContainerIndex++];
    
//    [mp_basketEntireImageView setFrame:basketRect];
//    [mp_basketSectionImageView setFrame:basketRect];
    
    p_image =  [mp_basketEntireImageView Get_Image_From_File:@"basket" with_type:@"png"];
    p_image = [mp_basketEntireImageView Image_Rotation_Angle_90:p_image with_direction:BG_RIGHT];
    [mp_basketEntireImageView SetImage : p_image];
    
    p_image =  [mp_basketSectionImageView Get_Image_From_File:@"basket_2_1" with_type:@"png"];
    p_image = [mp_basketSectionImageView Image_Rotation_Angle_90:p_image with_direction:BG_RIGHT];
    [mp_basketSectionImageView SetImage : p_image];
    
    point = mp_basketEntireImageView.center;
    point.x += 10;
    point.y -= 50;
    
    mp_basketEntireImageView.center = point;
    mp_basketSectionImageView.center = point;
    self.center = point;
    
}

- (void)ReceiveBall : (ZCGameBall *)p_ballSrc
{
    //[p_ballSrc setFrame:self.frame];
    p_ballSrc.center = self.center;
    mp_gameBall = p_ballSrc;
    [self insertSubview:p_ballSrc atIndex:1];
}

- (void)LostBall
{
    if (mp_gameBall == nil) {
        return;
    }
    //mp_gameBall.hidden = YES;
    [mp_gameBall removeFromSuperview];
    mp_gameBall = nil;
}

- (void)MoveToPoint:(CGPoint)point
{
    self.center = point;
}


@end
