//
//  ViewController.h
//  ThrowBallGame
//
//  Created by zhu on 15-3-19.
//  Copyright (c) 2015年 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZCGUIMgr;

@interface ViewController : UIViewController
{
    ZCGUIMgr *p_mgr;
    
}
@property (strong, nonatomic) IBOutlet UIView *pMainView;

- (void)ThrowBall;

@end
