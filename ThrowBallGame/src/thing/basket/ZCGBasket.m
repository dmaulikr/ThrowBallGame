//
//  ZCGameBasket.m
//  ThrowBallGame
//
//  Created by zhu on 4/2/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGBasket.h"
#import "../ball/ZCGBall.h"

@interface ZCGBasket ()
{
}
@property(nonatomic, retain) ZCGThing *mp_basketEntireImageView;
@property(nonatomic, retain) ZCGThing *mp_basketSectionImageView;

@end


// implementation
@implementation ZCGBasket
@synthesize mp_gameBall;
@synthesize mp_basketEntireImageView;
@synthesize mp_basketSectionImageView;

- (void)dealloc
{
    [mp_gameBall release];
    [mp_basketEntireImageView release];
    [mp_basketSectionImageView release];
    
    [super dealloc];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.mp_gameBall = nil;
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
    mp_basketEntireImageView = [[ZCGThing alloc] initWithFrame:basketRect];
    mp_basketSectionImageView = [[ZCGThing alloc] initWithFrame:basketRect];
    
    p_image =  [mp_basketEntireImageView Get_Image_From_File:@"basket" with_type:@"png"];
    [mp_basketEntireImageView SetImage : p_image];
    [mp_basketEntireImageView Image_Rotation_Angle_90:BG_RIGHT];
    
    p_image =  [mp_basketSectionImageView Get_Image_From_File:@"basket_2_1" with_type:@"png"];
    
    [mp_basketSectionImageView SetImage : p_image];
    [mp_basketSectionImageView Image_Rotation_Angle_90:BG_RIGHT];
    
    
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
    self.mp_gameBall = p_ballSrc;
    //[self insertSubview:p_ballSrc atIndex:1];
    [self insertSubview:mp_gameBall atIndex:1];
}

- (void)LostBall
{
    if (mp_gameBall == nil) {
        return;
    }
    //mp_gameBall.hidden = YES;
    [mp_gameBall removeFromSuperview];
    [mp_gameBall release];
    mp_gameBall = nil;
}

- (void)MoveBasketToPoint:(CGPoint)point
{ 
    self.center = point;
}


@end
