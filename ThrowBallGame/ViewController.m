//
//  ViewController.m
//  ThrowBallGame
//
//  Created by zhu on 15-3-19.
//  Copyright (c) 2015年 zhu. All rights reserved.
//

#import "ViewController.h"
#import "src/gameView/Game_View.h"
#import "src/gameView/ZCGameImageView.h"
#import "src/gameView/ZCGameDrawView.h"
#import "src/hole/ZCGameHole.h"
#import "src/ball/ZCGameBall.h"
#import "src/basket/ZCGameBasket.h"

@interface ViewController ()

@end

ZCGameDrawView *g_pDrawView;

@implementation ViewController

@synthesize pMainView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = ([UIScreen mainScreen].bounds);
    //CGRect *pRect = &rect;
    
    Game_View *pGameView = [[Game_View alloc] initWithFrame:rect];
    [pGameView setBackgroundColor:[UIColor clearColor]];
    [pGameView Set_Line_Color:[UIColor blueColor].CGColor];
    [pGameView Draw_Arrow_Line:CGPointMake(50, 150) with_end_point:CGPointMake(300, 300) with_line_width:3];
    [pMainView insertSubview:pGameView atIndex:0];
    
    
    //GameImageView *pImageView = [[GameImageView alloc] initWithFrame:rect];
    g_pDrawView = [[ZCGameDrawView alloc] initWithFrame:rect];
    [g_pDrawView DrawLine:CGPointMake(50, 150) withEndPoint:CGPointMake(100, 200)];
    [g_pDrawView Draw_Arrow_Line:CGPointMake(50, 150) with_end_point:CGPointMake(300, 300) with_line_width:3];
    g_pDrawView.image = [g_pDrawView Image_Rotation_Angle_90:g_pDrawView.image with_direction:BG_LEFT];
    [pMainView insertSubview:g_pDrawView atIndex:1];
    
    //[g_pDrawView AddImage:[g_pDrawView Get_Image_From_File:@"ball_3" with_type:@"png"] withFrame : CGRectMake(150, 150, 50, 50)];
    
    ZCGameHole *p_gameHole = [[ZCGameHole alloc] initWithFrame:CGRectMake(20, 20, 30, 30)];
    [p_gameHole InitHole:@"hole" with_type:@"png"];
    [pMainView insertSubview:p_gameHole atIndex:2];
    
    ZCGameBall *p_gameBall = [[ZCGameBall alloc] initWithFrame:CGRectMake(200, 200, 30, 30)];
    [p_gameBall InitBall:@"ball_3" with_type:@"png"];
    [pMainView insertSubview:p_gameBall atIndex:3];
    
    ZCGameBasket *p_gameBasket = [[ZCGameBasket alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    [p_gameBasket InitBasket];
    [pMainView insertSubview:p_gameBasket atIndex:4];
    
    [p_gameBasket MoveToPoint:CGPointMake(50, 300)];
    
    [p_gameBall removeFromSuperview];
    [p_gameBasket ReceiveBall:p_gameBall];
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
        [g_pDrawView MoveToPoint:point];
    //}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    //UIView *pView = [touch view];
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    
    //if (pView == g_pDrawView) {
        [g_pDrawView DrawLineToPoint:point];
        [g_pDrawView MoveToPoint:point];
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







































