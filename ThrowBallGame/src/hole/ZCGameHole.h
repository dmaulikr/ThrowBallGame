//
//  ZCGameHole.h
//  ThrowBallGame
//
//  Created by zhu on 4/1/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "../gameView/ZCGameImageView.h"

@interface ZCGameHole : ZCGameImageView
{
    
}
- (void)InitHole : (NSString *)file_name
       with_type : (NSString *)file_type;
- (void)SetHoleSize : (CGRect)rect;
- (void)MoveHoleToPoint : (CGPoint)point;

@end
