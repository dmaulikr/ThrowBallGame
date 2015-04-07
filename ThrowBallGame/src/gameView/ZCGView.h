//
//  ZCGView.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCGView : UIView
{
    BOOL m_bEnableTouchEvent;
}
- (UIButton *)Add_Button : (NSString *)title with_frame : (CGRect)frame with_tag:(int)nTag with_index : (int)nIndex;
- (UILabel *)Add_Label : (NSString *)text with_frame : (CGRect)frame with_index : (int)nIndex;

@end
