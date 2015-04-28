//
//  ViewController.m
//  ThrowBallGame
//
//  Created by zhu on 15-3-19.
//  Copyright (c) 2015年 zhu. All rights reserved.
//

#import "ViewController.h"
#import "src/gameView/Game_View.h"
#import "src/gameView/ZCGView.h"
#import "src/gameView/ZCGImageView.h"
#import "src/gameView/ZCGDrawView.h"
#import "src/thing/hole/ZCGHole.h"
#import "src/thing/ball/ZCGBall.h"
#import "src/thing/basket/ZCGBasket.h"
#import "./src/statistic/ZCGCard.h"
#import "./src/game/ZCGThrowBallCtrl.h"
#import "./src/game/ZCGTimer.h"
#import "./src/background/ZCGBackground.h"
#import "./src/scene/ZCGField.h"
#import "src/UIMgr/ZCGPlayScreenMgr.h"
#import "src/UIMgr/ZCGStartScreenMgr.h"
#import "src/UIMgr/ZCGUIMgr.h"

#import "src/game/ZCGGame.h"

@interface ViewController ()

@end

////////////////////////////NOTICE///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
// ok, i will initialize the game here instead of the appDelegate.m
///////////////////////////////////////////////////////////////////////////////

ZCGDrawView *g_pDrawView;
ZCGView *gp_mainGameView;
ZCGUIMgr *p_mgr;
ZCGGame *gp_game;

@implementation ViewController

@synthesize pMainView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    [self.navigationController setNavigationBarHidden:YES];
    
    //screen_bounds_rect = [ UIScreen mainScreen ].bounds;
    //status_bar_rect = [[UIApplication sharedApplication] statusBarFrame];
    
    CGRect rect = ([UIScreen mainScreen].bounds);
    
    pMainView.frame = rect;
    gp_mainGameView = [[ZCGView alloc] initWithFrame:rect];
    [pMainView insertSubview:gp_mainGameView atIndex:0];
    
    gp_game = [ZCGGame new];
    [gp_game InitGameWithMainView:gp_mainGameView];
    
    //CGRect *pRect = &rect;
    
    
//    Game_View *pGameView = [[Game_View alloc] initWithFrame:rect];
//    [pGameView setBackgroundColor:[UIColor clearColor]];
//    [pGameView Set_Line_Color:[UIColor blueColor].CGColor];
//    [pGameView Draw_Arrow_Line:CGPointMake(50, 150) with_end_point:CGPointMake(300, 300) with_line_width:3];
//    [gp_mainGameView insertSubview:pGameView atIndex:0];
//    
//    //GameImageView *pImageView = [[GameImageView alloc] initWithFrame:rect];
//    g_pDrawView = [[ZCGDrawView alloc] initWithFrame:rect];
//    [g_pDrawView DrawLine:CGPointMake(50, 150) withEndPoint:CGPointMake(100, 200)];
//    [g_pDrawView Draw_Arrow_Line:CGPointMake(50, 150) with_end_point:CGPointMake(300, 300) with_line_width:3];
//    g_pDrawView.image = [ZCGDrawView Image_Rotation_Angle_90:g_pDrawView.image with_direction:BG_LEFT];
//    [gp_mainGameView insertSubview:g_pDrawView atIndex:1];
//
//    
//    
//    ZCGHole *p_gameHole = [[ZCGHole alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
//    [p_gameHole InitHole:@"hole" with_type:@"png"];
//    [gp_mainGameView insertSubview:p_gameHole atIndex:2];
//    
//    ZCGBall *p_gameBall = [[ZCGBall alloc] initWithFrame:CGRectMake(250, 200, 30, 30)];
//    [p_gameBall InitBall:@"ball_3" with_type:@"png"];
//    [gp_mainGameView insertSubview:p_gameBall atIndex:3];
//    
//    ZCGBasket *p_gameBasket = [[ZCGBasket alloc] initWithFrame:CGRectMake(50, 200, 40, 40)];
//    [p_gameBasket InitBasket];
//    [gp_mainGameView insertSubview:p_gameBasket atIndex:4];
//    
//    ZCGThrowBallCtrl *p_throwBallCtrl = [[ZCGThrowBallCtrl alloc] init];
//    [p_throwBallCtrl SetBall:p_gameBall];
//    [p_throwBallCtrl TryAddHole:p_gameHole];
//    [p_throwBallCtrl SetBasket:p_gameBasket];
//    
//    [p_throwBallCtrl SetVelocityAndDirection:2 directionDeg:-70];
//    [p_throwBallCtrl ThrowBallInit];
//    
//    [ZCGTimer LaunchTimer:0.01 target:p_throwBallCtrl selector:@selector(ThrowBall) repeats:YES];
//    
//    //[p_gameBasket MoveBasketToPoint:CGPointMake(200, 200)];
//    
//    //[p_gameBasket ReceiveBall:p_gameBall];
//    
//    
//    ZCGBackground *p_backgnd = [[ZCGBackground alloc] initWithFrame:pMainView.frame];
//    [ZCGField LoadScene:p_backgnd];
//    //[p_backgnd LoadScene:"field"];
//    [gp_mainGameView insertSubview:p_backgnd atIndex:6];
//
//    [pGameView release];
//    [p_gameBall release];
//    [p_gameBasket release];
//    [p_gameHole release];
//    [p_throwBallCtrl release];
//    [p_backgnd release];
    
//    ZCGPlayScreenMgr *p_mgr = [ZCGPlayScreenMgr new];
//    [p_mgr InitPlayScreen:gp_mainGameView];
    
//    ZCGStartScreenMgr *p_mgr = [ZCGStartScreenMgr new];
//    [p_mgr InitStartScreen:gp_mainGameView];
    
//    p_mgr = [ZCGUIMgr new];
//    [p_mgr InitGameUI:gp_mainGameView];
//    p_mgr.mp_playMainScreen.hidden = NO;
//    p_mgr.mp_startMainScreen.hidden = YES;
    
}

- (void)ThrowBall
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [gp_game TouchEventHandle:touches withEvent:event withEventType:TOUCH_BEGAN_EVENT_TYPE];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[p_mgr TouchEventHandle:touches withEvent:event withEventType:TOUCH_MOVE_EVENT_TYPE];
   
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[p_mgr TouchEventHandle:touches withEvent:event withEventType:TOUCH_END_EVENT_TYPE];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
    return NO;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

@end







































