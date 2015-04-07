//
//  ZCGUIMgr.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//


//

#import <Foundation/Foundation.h>
@class ZCGView;

@interface ZCGUIMgr : NSObject
{
}
@property(nonatomic, retain) ZCGView *mp_mainViewContainer;
- (id)init:(ZCGView *)p_mainViewContainer;
- (void)InitGameUI:(ZCGView *)p_mainViewContainer;

@end
