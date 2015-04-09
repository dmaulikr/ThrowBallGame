//
//  ZCGPlayScreen.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGPlayScreenMgr.h"

#import "../gameView/ZCGView.h"
#import "../gameView/ZCGDrawView.h"
#import "../thing/ball/ZCGBall.h"
#import "../thing/basket//ZCGBasket.h"
#import "../background/ZCGBackground.h"
#import "../background/ZCGBackgroundMgr.h"


@interface ZCGPlayScreenMgr ()
@property(nonatomic, retain) ZCGView *mp_playViewContainer;
@property(nonatomic, retain) ZCGView *mp_touchView;

@property(nonatomic, retain) UIButton *mp_homeButton;
@property(nonatomic, retain) UIButton *mp_throwButton;
@property(nonatomic, retain) UIButton *mp_nextCardButton;
@property(nonatomic, retain) UIButton *mp_preCardButton;
@property(nonatomic, retain) UIButton *mp_powerPlusButton;
@property(nonatomic, retain) UIButton *mp_powerReduceButton;
@property(nonatomic, retain) UIButton *mp_directionPlusButton;
@property(nonatomic, retain) UIButton *mp_directionReduceButton;

@property(nonatomic, retain) UILabel *mp_powerLabel;
@property(nonatomic, retain) UILabel *mp_directionLabel;
@property(nonatomic, retain) UILabel *mp_stateLabel;

@property(nonatomic, retain) ZCGDrawView *mp_powerIndicatorView;
@property(nonatomic, retain) ZCGDrawView *mp_directionIndicatorView;
//@property(nonatomic, retain) ZCGView *mp_btnAndLabelView;
@end


@interface ZCGPlayScreenMgr ()
- (void)InitAttribute;
- (void)InitPlayScreenLabel;
- (void)InitPlayScreenButton;
- (void)InitIndicator;
@end


#define BG_POWER_PLUS_BUTTON_ID 0
#define BG_POWER_REDUCE_BUTTON_ID 1

#define BG_DIRECTION_PLUS_BUTTON_ID 2
#define BG_DIRECTION_REDUCE_BUTTON_ID 3

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
@synthesize mp_powerPlusButton;
@synthesize mp_powerReduceButton;
@synthesize mp_directionPlusButton;
@synthesize mp_directionReduceButton;

@synthesize mp_powerLabel;
@synthesize mp_directionLabel;
@synthesize mp_stateLabel;

@synthesize mp_powerIndicatorView;
@synthesize mp_directionIndicatorView;


- (void)dealloc
{
    [mp_playViewContainer release];
    
    [mp_homeButton release];
    [mp_throwButton release];
    [mp_nextCardButton release];
    [mp_preCardButton release];
    
    [mp_powerPlusButton release];
    [mp_powerReduceButton release];
    [mp_directionPlusButton release];
    [mp_directionReduceButton release];
    
    [mp_powerLabel release];
    [mp_directionLabel release];
    [mp_stateLabel release];
    
    [mp_gameBall release];
    [mp_gameBasket release];
    [mp_backgnd release];
    [mp_touchView release];
    
    [mp_powerIndicatorView release];
    [mp_directionIndicatorView release];
    
    [mp_gameContainer release];
    
    [super dealloc];
}

- (void)InitAttribute
{
    f_power_indicator_draw_line_width = BG_INDICATOR_WIDTH;
    f_power_indicator_draw_line_long = 30;
    power_indicator_start_draw_point.x = f_power_indicator_draw_line_width / 2;
    power_indicator_start_draw_point.y = 0;
    
    f_direction_indicator_draw_line_width = BG_INDICATOR_WIDTH;
    f_direction_indicator_draw_line_long = 30;
    direction_indicator_start_draw_point.x = f_direction_indicator_draw_line_width / 2;
    direction_indicator_start_draw_point.y = 0;
    
    m_nPlaySubviewIndex = 0;
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
    
    [self InitAttribute];
    
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
    
    // add indicator
    [self InitIndicator];
    
    // init the button
    [self InitPlayScreenButton];
    
    // init the label
    [self InitPlayScreenLabel];
    
    
    return YES;
}


- (void)InitIndicator
{
    CGSize size = CGSizeMake(15, 15);
    CGRect frame;
    CGRect rect = mp_playViewContainer.frame;
    CGRect indicator_rect = CGRectMake(rect.size.width-15, 120,
                                       BG_INDICATOR_WIDTH,
                                       BG_INDICATOR_LONG);
    
    mp_powerIndicatorView = [[ZCGDrawView alloc] initWithFrame:indicator_rect];
    [mp_powerIndicatorView setBackgroundColor:[UIColor blackColor]];
    [mp_powerIndicatorView SetStrokeColor:[UIColor greenColor].CGColor];
    [mp_powerIndicatorView SetLineWidth:BG_INDICATOR_WIDTH];
    [mp_powerIndicatorView DrawLine:power_indicator_start_draw_point withLineLong:f_power_indicator_draw_line_long withLineDirectionDeg:0];
    [mp_playViewContainer insertSubview:mp_powerIndicatorView atIndex:m_nPlaySubviewIndex++];
    
    
    indicator_rect = CGRectMake(rect.size.width-40, 120,
                                BG_INDICATOR_WIDTH, BG_INDICATOR_LONG);
    mp_directionIndicatorView = [[ZCGDrawView alloc] initWithFrame:indicator_rect];
    [mp_directionIndicatorView setBackgroundColor:[UIColor blackColor]];
    [mp_directionIndicatorView SetStrokeColor:[UIColor greenColor].CGColor];
    [mp_directionIndicatorView SetLineWidth:BG_INDICATOR_WIDTH];
    [mp_directionIndicatorView DrawLine:direction_indicator_start_draw_point withLineLong:f_direction_indicator_draw_line_long withLineDirectionDeg:0];
    [mp_playViewContainer insertSubview:mp_directionIndicatorView atIndex:m_nPlaySubviewIndex++];
    
    // power button and label
    rect = mp_powerIndicatorView.frame;
    frame = CGRectMake(rect.origin.x - 3, rect.origin.y + rect.size.height + 5, size.width, size.height);
    mp_powerPlusButton = [mp_playViewContainer Add_Button:@"+" with_frame:frame with_tag : BG_POWER_PLUS_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame.origin.y = rect.origin.y - 20;
    mp_powerReduceButton = [mp_playViewContainer Add_Button:@"-" with_frame:frame with_tag : BG_POWER_REDUCE_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame = CGRectMake(rect.origin.x - 32, 40, 70, 30);
    mp_powerLabel = [mp_playViewContainer Add_Label:@"POWER" with_frame:frame with_index:m_nPlaySubviewIndex++];
    [mp_powerLabel setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    
    // direction button and label
    rect = mp_directionIndicatorView.frame;
    frame = CGRectMake(rect.origin.x - 3, rect.origin.y + rect.size.height + 5, size.width, size.height);
    mp_directionPlusButton = [mp_playViewContainer Add_Button:@"+" with_frame:frame with_tag : BG_DIRECTION_PLUS_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame.origin.y = rect.origin.y - 20;
    mp_directionReduceButton = [mp_playViewContainer Add_Button:@"-" with_frame:frame with_tag : BG_DIRECTION_REDUCE_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame = CGRectMake(rect.origin.x - 32, 40, 70, 30);
    mp_directionLabel = [mp_playViewContainer Add_Label:@"DIRECT" with_frame:frame with_index:m_nPlaySubviewIndex++];
    [mp_directionLabel setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    
    
    [mp_powerPlusButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_powerReduceButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_directionPlusButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_directionReduceButton addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return;
}


- (void)InitPlayScreenLabel
{
    NSString *pStr = [[NSString alloc] initWithFormat:(@"CARD%d--TGT%d--LIFE%d--SCORE%d"),100,10, 100, 1000];
    
    mp_stateLabel = [mp_playViewContainer Add_Label:pStr with_frame:CGRectMake(90, 180, 350, 30) with_index:m_nPlaySubviewIndex++];
    [mp_stateLabel setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    
        
}

- (void)InitPlayScreenButton
{
    CGRect frame = CGRectMake(275, 300, 70, 20);
    
    mp_homeButton = [mp_playViewContainer Add_Button:@"HOME" with_frame:frame
                                            with_tag:BG_HOME_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    frame.origin.y += 80;
    mp_throwButton = [mp_playViewContainer Add_Button:@"THROW" with_frame:frame
                                             with_tag:BG_THROW_BUTTON_ID with_index:m_nPlaySubviewIndex++];
    
    frame = CGRectMake(250, 300, 70, 20);
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
            NSLog(@"POWER PLUS BUTTON IS CLICKED\n");
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

- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    UIView *p_view = [touch view];
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    
    if (p_view == mp_powerIndicatorView) {
        [mp_powerIndicatorView SetStrokeColor:[UIColor blackColor].CGColor];
        [mp_powerIndicatorView DrawLine:power_indicator_start_draw_point withLineLong:BG_INDICATOR_LONG withLineDirectionDeg:0];
        [mp_powerIndicatorView SetStrokeColor:[UIColor greenColor].CGColor];
        [mp_powerIndicatorView DrawLine:power_indicator_start_draw_point withLineLong:point.y withLineDirectionDeg:0];
        //[mp_powerIndicatorView DrawLine:power_indicator_start_draw_point withEndPoint:point];
    }
    else if (p_view == mp_directionIndicatorView)
    {
        [mp_directionIndicatorView SetStrokeColor:[UIColor blackColor].CGColor];
        [mp_directionIndicatorView DrawLine:power_indicator_start_draw_point withLineLong:BG_INDICATOR_LONG withLineDirectionDeg:0];
        [mp_directionIndicatorView SetStrokeColor:[UIColor greenColor].CGColor];
        [mp_directionIndicatorView DrawLine:power_indicator_start_draw_point
                               withLineLong:point.y withLineDirectionDeg:0];
    }
}

@end














