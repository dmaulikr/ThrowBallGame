//
//  ZCGPlayScreen.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGPlayScreenMgr.h"

@implementation ZCGPlayScreenMgr

- (BOOL)InitPlayScreen:(ZCGView *)p_mainPlayView
{
    if (p_mainPlayView == nil) {
        return NO;
    }
    
    nSubviewIndex = 0;
    
    mp_playViewContainer = p_mainPlayView;
    
    // init the background
    
    // init the view
    
    // init the button
    [self InitPlayScreenButton];
    mp_stateLabel = [mp_playViewContainer Add_Label:@"game statistic.." with_frame:CGRectMake(200, 200, 30, 30) with_index:nSubviewIndex++];
    
    return YES;
}

- (void)InitPlayScreenButton
{
    CGRect frame = CGRectMake(100, 100, 30, 30);
    
    mp_homeButton = [mp_playViewContainer Add_Button:@"HOME" with_frame:frame
                                            with_tag:BG_HOME_BUTTON_ID with_index:nSubviewIndex++];
    mp_throwButton = [mp_playViewContainer Add_Button:@"THROW" with_frame:frame
                                             with_tag:BG_THROW_BUTTON_ID with_index:nSubviewIndex++];
    mp_nextCardButton = [mp_playViewContainer Add_Button:@"NEXT" with_frame:frame
                                                with_tag:BG_NEXT_CARD_BUTTON_ID with_index:nSubviewIndex++];
    mp_preCardButton = [mp_playViewContainer Add_Button:@"PRE" with_frame:frame
                                               with_tag:BG_PRE_CARD_BUTTON_ID with_index:nSubviewIndex++];
    
    [mp_homeButton setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    [mp_throwButton setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    [mp_nextCardButton setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    [mp_preCardButton setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    
    // add touch up inside event handle to buttons
    [mp_homeButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_throwButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_nextCardButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_preCardButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return;
}

- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender
{
    switch ([sender tag]) {
        case BG_POWER_PLUS_BUTTON_ID:
            break;
        case BG_POWER_REDUCE_BUTTON_ID:
            break;
        case BG_DIRECTION_PLUS_BUTTON_ID:
            break;
        case BG_DIRECTION_REDUCE_BUTTON_ID:
            break;
        case BG_THROW_BUTTON_ID:
            break;
        case BG_HOME_BUTTON_ID:
            break;
        case BG_PRE_CARD_BUTTON_ID:
            break;
        case BG_NEXT_CARD_BUTTON_ID:
            break;
        default:
            break;
    }
    
}

@end














