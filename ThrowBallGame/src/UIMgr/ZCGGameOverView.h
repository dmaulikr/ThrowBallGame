//
//  ZCGGameOverView.h
//  ThrowBallGame
//
//  Created by zhu on 4/16/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

// --------------------tip-----
//-----------------------------
// this class view is devised to interact with players when there is no lifes that results game over.
// this view will give the players two button to select, one is return while another is restart.
// if the retrun button is touched up, the view will turn back to the launched view.
// if the restart button is touched up, the game will be restarted at first level.
// but this view does not deal with the buttons touched up action, it will post a message instead.
// to use the fuction, just initialize an instance of this class, and make its parameter "hidden" to NO.



#import "../gameView/ZCGView.h"

#define BG_RETURN_BTN_ID 0
#define BG_RESTART_BTN_ID 1

@interface ZCGGameOverView : ZCGView
{
    
}
@property(nonatomic, retain) UIButton *mp_returnBtn;
@property(nonatomic, retain) UIButton *mp_restartBtn;
@property(nonatomic, retain) UILabel *mp_gameOverLabel;
- (void)InitButton;
- (void)InitLabel;
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;

@end
