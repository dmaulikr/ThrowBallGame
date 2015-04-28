//
//  ZCGView.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

/*
 * this class ZCGView inherited the UIView and implements some function simplely 
 */


#import <UIKit/UIKit.h>

@interface ZCGView : UIView
{
    BOOL m_bEnableTouchEvent;
}
// create a button and add to the view,and the method will return
// the created button reference, you must manually release it to avoid the memory leak.
// param nTag: the tag of the created button
// param nIndex: insert the button to the view at the nIndex
- (UIButton *)Add_Button : (NSString *)title with_frame : (CGRect)frame with_tag:(int)nTag with_index : (int)nIndex;

// create a label and add to the view,and the method will return
// the created label reference, you must manually release it to avoid the memory leak.
// param nIndex: insert the label to the view at the nIndex
- (UILabel *)Add_Label : (NSString *)text with_frame : (CGRect)frame with_index : (int)nIndex;

// forbid the touch event of this view object
- (void)DisableTouchEvent;
// allow the touch event of this view object
- (void)EnableTouchEvent;
@end
