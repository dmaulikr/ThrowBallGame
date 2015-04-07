//
//  ZCGTree.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGTree.h"

@implementation ZCGTree

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self LoadTree];
    }
    return self;
}

- (void)LoadTree
{
    UIImage *p_image =  [self Get_Image_From_File:@"tree_1" with_type:@"png"];
    [self SetImage:p_image];
    
    return;
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
