//
//  ViewController.m
//  ThrowBallGame
//
//  Created by zhu on 15-3-19.
//  Copyright (c) 2015年 zhu. All rights reserved.
//

#import "ViewController.h"
#import "src/gameView/Game_View.h"
#import "src/gameView/ZCGImageView.h"
#import "src/gameView/ZCGDrawView.h"
#import "src/hole/ZCGHole.h"
#import "src/ball/ZCGBall.h"
#import "src/basket/ZCGBasket.h"
#import "./src/statistic/ZCGCard.h"
#import "./src/game/ZCGThrowBallCtrl.h"
#import "./src/game/ZCGTimer.h"
#import "./src/UIMgr/ZCGBackground.h"
#import "./src/scene/ZCGField.h"

@interface ViewController ()

@end

ZCGDrawView *g_pDrawView;

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
    
    //CGRect *pRect = &rect;
    
    Game_View *pGameView = [[Game_View alloc] initWithFrame:rect];
    [pGameView setBackgroundColor:[UIColor clearColor]];
    [pGameView Set_Line_Color:[UIColor blueColor].CGColor];
    [pGameView Draw_Arrow_Line:CGPointMake(50, 150) with_end_point:CGPointMake(300, 300) with_line_width:3];
    [pMainView insertSubview:pGameView atIndex:0];
    
    //GameImageView *pImageView = [[GameImageView alloc] initWithFrame:rect];
    g_pDrawView = [[ZCGDrawView alloc] initWithFrame:rect];
    [g_pDrawView DrawLine:CGPointMake(50, 150) withEndPoint:CGPointMake(100, 200)];
    [g_pDrawView Draw_Arrow_Line:CGPointMake(50, 150) with_end_point:CGPointMake(300, 300) with_line_width:3];
    g_pDrawView.image = [ZCGDrawView Image_Rotation_Angle_90:g_pDrawView.image with_direction:BG_LEFT];
    [pMainView insertSubview:g_pDrawView atIndex:1];

    
    
    ZCGHole *p_gameHole = [[ZCGHole alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
    [p_gameHole InitHole:@"hole" with_type:@"png"];
    [pMainView insertSubview:p_gameHole atIndex:2];
    
    ZCGBall *p_gameBall = [[ZCGBall alloc] initWithFrame:CGRectMake(250, 200, 30, 30)];
    [p_gameBall InitBall:@"ball_3" with_type:@"png"];
    [pMainView insertSubview:p_gameBall atIndex:3];
    
    ZCGBasket *p_gameBasket = [[ZCGBasket alloc] initWithFrame:CGRectMake(50, 200, 40, 40)];
    [p_gameBasket InitBasket];
    [pMainView insertSubview:p_gameBasket atIndex:4];
    
    ZCGThrowBallCtrl *p_throwBallCtrl = [[ZCGThrowBallCtrl alloc] init];
    [p_throwBallCtrl SetBall:p_gameBall];
    [p_throwBallCtrl TryAddHole:p_gameHole];
    [p_throwBallCtrl SetBasket:p_gameBasket];
    
    [p_throwBallCtrl SetVelocityAndDirection:2 directionDeg:-70];
    [p_throwBallCtrl ThrowBallInit];
    
    [ZCGTimer LaunchTimer:0.01 target:p_throwBallCtrl selector:@selector(ThrowBall) repeats:YES];
    
    //[p_gameBasket MoveBasketToPoint:CGPointMake(200, 200)];
    
    //[p_gameBasket ReceiveBall:p_gameBall];
    
    
    ZCGBackground *p_backgnd = [[ZCGBackground alloc] initWithFrame:pMainView.frame];
    [ZCGField LoadField:p_backgnd];
    //[p_backgnd setBackgroundColor:[UIColor blackColor]];
    [pMainView insertSubview:p_backgnd atIndex:0];
    
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
    //NSLog(@"TouchesBegan...\n");
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    //UIView *pView = [touch view];
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    
    //if (pView == g_pDrawView) {
        [g_pDrawView DrawMoveToPoint:point];
    //}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    //UIView *pView = [touch view];
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    
    //if (pView == g_pDrawView) {
        [g_pDrawView DrawAddLineToPoint:point];
        [g_pDrawView DrawMoveToPoint:point];
        //NSLog(@"touchesMoved...\n");
    //}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

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







































