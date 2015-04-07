//
//  ZCGPlayScreen.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGPlayScreenMgr.h"

#import "../gameView/ZCGView.h"
#import "../thing/ball/ZCGBall.h"
#import "../thing/basket//ZCGBasket.h"
#import "../background/ZCGBackground.h"
#import "../background/ZCGBackgroundMgr.h"


@interface ZCGPlayScreenMgr ()
{
}
@property(nonatomic, retain) UIButton *mp_homeButton;
@property(nonatomic, retain) UIButton *mp_throwButton;
@property(nonatomic, retain) UIButton *mp_nextCardButton;
@property(nonatomic, retain) UIButton *mp_preCardButton;
@property(nonatomic, retain) UILabel *mp_stateLabel;
//@property(nonatomic, retain) ZCGView *mp_btnAndLabelView;
@end



@implementation ZCGPlayScreenMgr
@synthesize mp_playViewContainer;
@synthesize mp_gameBall;
@synthesize mp_gameBasket;
@synthesize mp_backgnd;
@synthesize mp_touchView;
@synthesize mp_gameContainer;

@synthesize mp_homeButton;
@synthesize mp_throwButton;
@synthesize mp_nextCardButton;
@synthesize mp_preCardButton;
@synthesize mp_stateLabel;
//@synthesize mp_btnAndLabelView;


- (void)dealloc
{
    [mp_playViewContainer release];
    
    [mp_homeButton release];
    [mp_throwButton release];
    [mp_nextCardButton release];
    [mp_preCardButton release];
    [mp_stateLabel release];
    
    [mp_gameBall release];
    [mp_gameBasket release];
    [mp_backgnd release];
    [mp_touchView release];
    
    [mp_gameContainer release];
    
    [super dealloc];
}

// fisrt background
// second game view:ball basket and so on
// thirst touch view
// forth component button and label and so on
- (BOOL)InitPlayScreen:(ZCGView *)p_mainPlayView
{
    if (p_mainPlayView == nil) {
        return NO;
    }
    
    m_nPlaySubviewIndex = 0;
    
    self.mp_playViewContainer = p_mainPlayView;
    
    // init the background
    mp_backgnd = [[ZCGBackground alloc] initWithFrame:mp_playViewContainer.frame];
    [mp_backgnd LoadScene:"field"];
    [mp_playViewContainer insertSubview:mp_backgnd atIndex:m_nPlaySubviewIndex++];
    
    // ball and basket and hole and other
    // need to insert to the mp_gameContainer
    mp_gameContainer = [[ZCGView alloc] initWithFrame:mp_playViewContainer.frame];
    [mp_gameContainer setBackgroundColor:[UIColor clearColor]];
    [mp_playViewContainer insertSubview:mp_touchView atIndex:m_nPlaySubviewIndex++];
    
    // init the touch view
    mp_touchView = [[ZCGView alloc] initWithFrame:mp_playViewContainer.frame];
    [mp_touchView setBackgroundColor:[UIColor clearColor]];
    [mp_playViewContainer insertSubview:mp_touchView atIndex:m_nPlaySubviewIndex++];
    
    // init the button
    [self InitPlayScreenButton];
    
    // init the label
    [self InitPlayScreenLabel];
    
    
    return YES;
}

- (void)InitPlayScreenLabel
{
    mp_stateLabel = [mp_playViewContainer Add_Label:@"game statistic.." with_frame:CGRectMake(200, 200, 120, 30) with_index:m_nPlaySubviewIndex++];
    [mp_stateLabel setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
}

- (void)InitPlayScreenButton
{
    CGRect frame = CGRectMake(250, 100, 70, 30);
    
    mp_homeButton = [mp_playViewContainer Add_Button:@"HOME" with_frame:frame
                                            with_tag:BG_HOME_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame.origin.y += 80;
    mp_throwButton = [mp_playViewContainer Add_Button:@"THROW" with_frame:frame
                                             with_tag:BG_THROW_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame.origin.y += 80;
    mp_nextCardButton = [mp_playViewContainer Add_Button:@"NEXT" with_frame:frame
                                                with_tag:BG_NEXT_CARD_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame.origin.y += 80;
    mp_preCardButton = [mp_playViewContainer Add_Button:@"PRE" with_frame:frame
                                               with_tag:BG_PRE_CARD_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    
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
            NSLog(@"START BUTTON IS CLICKED\n");
            break;
        case BG_POWER_REDUCE_BUTTON_ID:
            NSLog(@"POWER REDUCE BUTTON IS CLICKED\n");
            break;
        case BG_DIRECTION_PLUS_BUTTON_ID:
            NSLog(@"DIRECTION PLUS BUTTON IS CLICKED\n");
            break;
        case BG_DIRECTION_REDUCE_BUTTON_ID:
            NSLog(@"DIRECTION REDUCE BUTTON IS CLICKED\n");
            break;
        case BG_THROW_BUTTON_ID:
            NSLog(@"THROW BUTTON IS CLICKED\n");
            break;
        case BG_HOME_BUTTON_ID:
            NSLog(@"HOME BUTTON IS CLICKED\n");
            break;
        case BG_PRE_CARD_BUTTON_ID:
            NSLog(@"PRE CARD BUTTON IS CLICKED\n");
            break;
        case BG_NEXT_CARD_BUTTON_ID:
            NSLog(@"NEXT CARD BUTTON IS CLICKED\n");
            break;
        default:
            break;
    }
    
}

@end














