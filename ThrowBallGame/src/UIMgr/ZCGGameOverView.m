//
//  ZCGGameOverView.m
//  ThrowBallGame
//
//  Created by zhu on 4/16/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGGameOverView.h"

#import "../gameMsg/ZCGMessage.h"
#import "../game/ZCGMessageID.h"

#pragma pack(1)

#pragma pack()



@implementation ZCGGameOverView
@synthesize mp_returnBtn;
@synthesize mp_restartBtn;
@synthesize mp_gameOverLabel;


- (void)dealloc
{
    
    [mp_returnBtn release];
    [mp_restartBtn release];
    [mp_gameOverLabel release];
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    //CGRect _frame = CGRectMake(0, 0, 150, 250);
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor grayColor]];
        [self InitLabel];
        [self InitButton];
    }
    return self;
}


- (void)InitLabel
{
    CGPoint centerPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    CGRect frame = CGRectMake(centerPoint.x + 20, centerPoint.y - 100, 40, 300);
    
    self.mp_gameOverLabel = [self Add_Label:@"GAME OVER" with_frame:frame with_index:2];
    [mp_gameOverLabel setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    mp_gameOverLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:35];
    mp_gameOverLabel.frame = frame;	
}

- (void)InitButton
{
    CGPoint centerPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    
    CGRect frame = CGRectMake(centerPoint.x - 60, centerPoint.y - 100, 40, 100);
    self.mp_returnBtn = [self Add_Button:@"RETURN" with_frame: frame with_tag:BG_RETURN_BTN_ID with_index:0];
    self.mp_restartBtn = [self Add_Button:@"RESTART" with_frame: frame with_tag:BG_RESTART_BTN_ID with_index:1];
    
    [mp_restartBtn setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    [mp_returnBtn setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    
    //mp_restartBtn..font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:35];
    
    mp_returnBtn.frame = frame;
    
    frame.origin.y += 120;
    //frame.origin
    mp_restartBtn.frame = frame;
    
    [mp_restartBtn addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_returnBtn addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender
{
    //float fTemp;
    
    switch ([sender tag]) {
        case BG_RESTART_BTN_ID:
            [ZCGMessage PostGameMessage:GM_RESTART_BTN_TOUCHED_ID];
            break;
            case BG_RETURN_BTN_ID:
            [ZCGMessage PostGameMessage:GM_RETURN_BTN_TOUCHED_ID];
            break;
        default:
            break;
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
