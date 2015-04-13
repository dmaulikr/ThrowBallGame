//
//  ZCGPlayScreen.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGPlayScreenMgr.h"
#import "ZCGUIMgr.h"

#import "../gameView/ZCGView.h"
#import "../gameView/ZCGDrawView.h"
#import "../thing/ball/ZCGBall.h"
#import "../thing/basket//ZCGBasket.h"
#import "../background/ZCGBackground.h"
#import "../background/ZCGBackgroundMgr.h"
#import "../statistic/ZCGStat.h"

#import "../gameMsg/ZCGMessage.h"
#import "../game/ZCGMessageID.h"


BEGIN_GAME_MESSAGE(ZCGPlayScreenMgr)
//ADD_GAME_MSG(TouchViewClicked, GM_TOUCH_VIEW_TOUCHED_ID)
END_GAME_MESSAGE()


//extern ZCGUIMgr *p_mgr;

@interface ZCGPlayScreenMgr ()
@property(nonatomic, retain) ZCGView *mp_playViewContainer;
@property(nonatomic, retain) ZCGView *mp_touchView;
@property(nonatomic, retain) ZCGDrawView *mp_drawView;



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

- (void)UpdateDrawView;
- (float)ValueConstraint:(float)fValue;
- (float)GetDirectionDeg;
- (float)GetPower;
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
@synthesize mp_drawView;
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

//@synthesize mp_gameUIMgr;
//@synthesize mp_gameStat;


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
    
    //[mp_gameUIMgr release];
    
    //[mp_gameStat release];
    
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
    
    m_bNeedDrawArrow = FALSE;
    ballPoint = CGPointMake(0, 0);
}

// fisrt background
// second game view:ball basket and so on
// thirst touch view
// forth component button and label and so on
- (BOOL)InitPlayScreen:(ZCGView *)p_mainPlayView
{
    INIT_GAME_MESSAGE()
    
    if (p_mainPlayView == nil) {
        return NO;
    }
    
    [self InitAttribute];
    
    self.mp_playViewContainer = p_mainPlayView;
    
    // init the background
    mp_backgnd = [[ZCGBackground alloc] initWithFrame:mp_playViewContainer.frame];
    [mp_backgnd LoadScene:"field"];
    [mp_playViewContainer insertSubview:mp_backgnd atIndex:m_nPlaySubviewIndex++];
    
    mp_drawView = [[ZCGDrawView alloc] initWithFrame:mp_playViewContainer.frame];
    [mp_drawView setBackgroundColor:[UIColor clearColor]];
    [mp_drawView SetStrokeColor:[UIColor blueColor].CGColor];
    [mp_playViewContainer insertSubview:mp_drawView atIndex:m_nPlaySubviewIndex++];
    [self UpdateDrawView];
    
    // ball and basket and hole and other
    // need to insert to the mp_gameContainer
    mp_gameContainer = [[ZCGThing alloc] initWithFrame:mp_playViewContainer.frame];
    [mp_gameContainer setBackgroundColor:[UIColor clearColor]];
    [mp_playViewContainer insertSubview:mp_gameContainer atIndex:m_nPlaySubviewIndex++];
    
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
    float fTemp;
    
    switch ([sender tag]) {
        case BG_POWER_PLUS_BUTTON_ID:
            //NSLog(@"POWER PLUS BUTTON IS CLICKED\n");
            //endPoint = power_indicator_start_draw_point;
            f_power_indicator_draw_line_long++;
            f_power_indicator_draw_line_long = [self ValueConstraint:f_power_indicator_draw_line_long];
            [self IndicatorDrawLine:mp_powerIndicatorView];
            [ZCGMessage SetArgument:&f_power_indicator_draw_line_long withSize:sizeof(float)];
            [ZCGMessage PostGameMessage:GM_POWER_CHANGE_ID];
            break;
        case BG_POWER_REDUCE_BUTTON_ID:
            //NSLog(@"POWER REDUCE BUTTON IS CLICKED\n");
            f_power_indicator_draw_line_long--;
            f_power_indicator_draw_line_long = [self ValueConstraint:f_power_indicator_draw_line_long];
            [self IndicatorDrawLine:mp_powerIndicatorView];
            [ZCGMessage SetArgument:&f_power_indicator_draw_line_long withSize:sizeof(float)];
            [ZCGMessage PostGameMessage:GM_POWER_CHANGE_ID];
            break;
        case BG_DIRECTION_PLUS_BUTTON_ID:
            //NSLog(@"DIRECTION PLUS BUTTON IS CLICKED\n");
            f_direction_indicator_draw_line_long++;
            f_direction_indicator_draw_line_long = [self ValueConstraint:f_direction_indicator_draw_line_long];
            [self IndicatorDrawLine:mp_directionIndicatorView];
            fTemp = [self GetDirectionDeg];
            [ZCGMessage SetArgument:&fTemp withSize:sizeof(float)];
            [ZCGMessage PostGameMessage:GM_DIRECT_CHANGE_ID];
            break;
        case BG_DIRECTION_REDUCE_BUTTON_ID:
            //NSLog(@"DIRECTION REDUCE BUTTON IS CLICKED\n");
            f_direction_indicator_draw_line_long--;
            f_direction_indicator_draw_line_long = [self ValueConstraint:f_direction_indicator_draw_line_long];
            [self IndicatorDrawLine:mp_directionIndicatorView];
            fTemp = [self GetDirectionDeg];
            [ZCGMessage SetArgument:&fTemp withSize:sizeof(float)];
            [ZCGMessage PostGameMessage:GM_DIRECT_CHANGE_ID];
            break;
        case BG_THROW_BUTTON_ID:
            if (m_bNeedDrawArrow == FALSE) {
                break;
            }
            //NSLog(@"THROW BUTTON IS CLICKED\n");
            [ZCGMessage SetArgument:&f_power_indicator_draw_line_long withSize:sizeof(float)];
            [ZCGMessage PostGameMessage:GM_POWER_CHANGE_ID];
            fTemp = [self GetDirectionDeg];
            [ZCGMessage SetArgument:&fTemp withSize:sizeof(float)];
            [ZCGMessage PostGameMessage:GM_DIRECT_CHANGE_ID];
            [ZCGMessage PostGameMessage:GM_THROW_BTN_TOUCHED_ID];
            m_bNeedDrawArrow =FALSE;
            [self UpdateDrawView];
            break;
        case BG_HOME_BUTTON_ID:
            //NSLog(@"HOME BUTTON IS CLICKED\n");
            //mp_gameUIMgr.mp_startMainScreen.hidden = NO;
            //mp_gameUIMgr.mp_playMainScreen.hidden = YES;
            [ZCGMessage PostGameMessage:GM_HOME_BTN_TOUCHED_ID];
            break;
        case BG_PRE_CARD_BUTTON_ID:
            //NSLog(@"PRE CARD BUTTON IS CLICKED\n");
            [ZCGMessage PostGameMessage:GM_PRE_CARD_BBTN_TOUCHED_ID];
            break;
        case BG_NEXT_CARD_BUTTON_ID:
            //NSLog(@"NEXT CARD BUTTON IS CLICKED\n");
            [ZCGMessage PostGameMessage:GM_NEXT_CARD_BTN_TOUCHED_ID];
            break;
        default:
            break;
    }
    
    [self UpdateDrawView];
    
}

- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    UIView *p_view = [touch view];
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    float fTemp;
    
    
    if (p_view == mp_powerIndicatorView) {
        f_power_indicator_draw_line_long = point.y;
        [self IndicatorDrawLine:mp_powerIndicatorView];
        [ZCGMessage SetArgument:&f_power_indicator_draw_line_long withSize:sizeof(float)];
        [ZCGMessage PostGameMessage:GM_POWER_CHANGE_ID];
    }
    else if (p_view == mp_directionIndicatorView)
    {
        f_direction_indicator_draw_line_long = point.y;
        [self IndicatorDrawLine:mp_directionIndicatorView];
        fTemp = [self GetDirectionDeg];
        [ZCGMessage SetArgument:&fTemp withSize:sizeof(float)];
        [ZCGMessage PostGameMessage:GM_DIRECT_CHANGE_ID];
    }
    else if (p_view == mp_touchView)
    {
//        ZCGBall *p_ball = [mp_gameStat GetGameElement]->p_ball;
//        [p_ball MoveBallToPoint : point];
        if (point.x <= BALL_LIMIT_X - 10 && point.y <= BALL_LIMIT_Y -10) {
            m_bNeedDrawArrow = TRUE;
            ballPoint = point;
            [ZCGMessage SetArgument:&point withSize:sizeof(CGPoint)];
            [ZCGMessage PostGameMessage:GM_TOUCH_VIEW_TOUCHED_ID];
        }
    }
    
    [self UpdateDrawView];
}

- (void)UpdateDrawView
{
    CGPoint point1 = CGPointMake(BALL_LIMIT_X, 0);
    CGPoint point2 = CGPointMake(0, BALL_LIMIT_Y);
    CGPoint point3 = CGPointMake(BALL_LIMIT_X, BALL_LIMIT_Y);
    [mp_drawView ClearDraw];
    [mp_drawView DrawLine:point1 withEndPoint:point3];
    [mp_drawView DrawLine:point2 withEndPoint:point3];
    if (m_bNeedDrawArrow == TRUE) {
        [mp_drawView Draw_Arrow_Line:ballPoint with_line_long:40 with_line_direction:[self GetDirectionDeg]];
    }
}

- (float)ValueConstraint:(float)fValue
{
    float fTemp = fValue;
    
    if (fValue <= 0)
    {
        fTemp = 0;
    }
    
    if (fValue >= BG_INDICATOR_LONG)
    {
        fTemp = BG_INDICATOR_LONG;
    }
    
    return fTemp;
    
}


- (float)GetDirectionDeg
{
    float temp;
    
    temp = f_direction_indicator_draw_line_long * 1.8 - 90;
    if (temp >= 89) {
        temp = 89;
    }
    else if (temp <= -89)
    {
        temp = -89;
    }
    
    return temp;
}


- (float)GetPower
{
    
    return f_power_indicator_draw_line_long;
}


- (void)IndicatorDrawLine:(ZCGDrawView *)p_indicator
{
    if (p_indicator == mp_powerIndicatorView) {
        [p_indicator SetStrokeColor:[UIColor blackColor].CGColor];
        [p_indicator DrawLine:power_indicator_start_draw_point withLineLong:BG_INDICATOR_LONG withLineDirectionDeg:0];
        [p_indicator SetStrokeColor:[UIColor greenColor].CGColor];
        [p_indicator DrawLine:power_indicator_start_draw_point withLineLong:f_power_indicator_draw_line_long withLineDirectionDeg:0];
        //[mp_powerIndicatorView DrawLine:power_indicator_start_draw_point withEndPoint:point];
    }
    else if (p_indicator == mp_directionIndicatorView)
    {
        [p_indicator SetStrokeColor:[UIColor blackColor].CGColor];
        [p_indicator DrawLine:direction_indicator_start_draw_point withLineLong:BG_INDICATOR_LONG withLineDirectionDeg:0];
        [p_indicator SetStrokeColor:[UIColor greenColor].CGColor];
        [p_indicator DrawLine:direction_indicator_start_draw_point withLineLong:f_direction_indicator_draw_line_long withLineDirectionDeg:0];
    }

    return;
}

@end














