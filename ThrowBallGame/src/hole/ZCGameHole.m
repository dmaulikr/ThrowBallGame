//
//  ZCGameHole.m
//  ThrowBallGame
//
//  Created by zhu on 4/1/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGameHole.h"

@implementation ZCGameHole

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self DisableTouchEvent];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)InitHole : (NSString *)file_name
       with_type : (NSString *)file_type
{
    [self SetImage:[self Get_Image_From_File:file_name with_type:file_type]];
}

- (void)SetHoleSize:(CGRect)rect
{
    [self setFrame:rect];
}


- (void)MoveHoleToPoint : (CGPoint)point
{
    self.center = point;
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
