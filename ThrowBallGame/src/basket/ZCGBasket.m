//
//  ZCGameBasket.m
//  ThrowBallGame
//
//  Created by zhu on 4/2/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGBasket.h"

@implementation ZCGBasket

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
    CGRect basketRect = self.frame;
    
    m_basketCenterPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    basketRect.origin = m_basketCenterPoint;
    
    m_nContainerIndex = 0;
    
    //mp_containerView = [[UIView alloc] initWithFrame:basketRect];
    mp_basketEntireImageView = [[ZCGImageView alloc] initWithFrame:basketRect];
    mp_basketSectionImageView = [[ZCGImageView alloc] initWithFrame:basketRect];
    
    p_image =  [mp_basketEntireImageView Get_Image_From_File:@"basket" with_type:@"png"];
    p_image = [mp_basketEntireImageView Image_Rotation_Angle_90:p_image with_direction:BG_RIGHT];
    [mp_basketEntireImageView SetImage : p_image];
    
    p_image =  [mp_basketSectionImageView Get_Image_From_File:@"basket_2_1" with_type:@"png"];
    p_image = [mp_basketSectionImageView Image_Rotation_Angle_90:p_image with_direction:BG_RIGHT];
    [mp_basketSectionImageView SetImage : p_image];
    
    
    mp_basketEntireImageView.center = m_basketCenterPoint;
    mp_basketSectionImageView.center = m_basketCenterPoint;
    
    // set the background color
    [mp_basketEntireImageView setBackgroundColor:[UIColor clearColor]];
    [mp_basketSectionImageView setBackgroundColor:[UIColor clearColor]];
    [self setBackgroundColor:[UIColor clearColor]];
    
    // insert the basket view to the view container (self)
    [self insertSubview:mp_basketEntireImageView atIndex:m_nContainerIndex++];
    [self insertSubview:mp_basketSectionImageView atIndex:m_nContainerIndex++];
    
}

- (void)ReceiveBall : (ZCGBall *)p_ballSrc
{
    [p_ballSrc removeFromSuperview];
    [p_ballSrc MoveBallToPoint:m_basketCenterPoint];
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

- (void)MoveBasketToPoint:(CGPoint)point
{ 
    self.center = point;
}


@end
