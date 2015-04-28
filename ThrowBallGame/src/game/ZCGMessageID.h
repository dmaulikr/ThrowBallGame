//
//  ZCGMessageID.h
//  ThrowBallGame
//
//  Created by zhu on 4/11/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#ifndef ThrowBallGame_ZCGMessageID_h
#define ThrowBallGame_ZCGMessageID_h


//#define TOUCH_VIEW_CLICK_ID 10
//#define POWER_PLUS_BUTTON_CLICKED_ID 11

#ifndef _GAME_MESSAGE_ID_
#define _GAME_MESSAGE_ID_
enum _GAME_MESSAGE_ID_
{
    // GM--- game message
    GM_TOUCH_VIEW_TOUCHED_ID = 1,
    
    // button touched msg id
    GM_POWER_PLUS_BTN_TOUCHED_ID = 2,
    GM_POWER_REDUCE_BTN_TOUCHED_ID,
    GM_DIRECT_PLUS_BTN_TOUCHED_ID = 5,
    GM_DIRECT_REDUCE_BTN_TOUCHED_ID,
    
    GM_THROW_BTN_TOUCHED_ID = 7,
    GM_HOME_BTN_TOUCHED_ID,
    GM_PRE_CARD_BBTN_TOUCHED_ID = 9,
    GM_NEXT_CARD_BTN_TOUCHED_ID,
    
    // indicator msg id
    GM_POWER_INDICATOR_TOUCHED_ID = 11,
    GM_DIRECT_INDICATOR_TOUCHED_ID,
    
    GM_START_BTN_TOUCHED_ID = 13,
    GM_HELP_BTN_TOUCHED_ID,
    
    GM_POWER_CHANGE_ID = 15,
    GM_DIRECT_CHANGE_ID,
    
    GM_THROW_BALL_SUCCESS_ID = 17,
    GM_THROW_BALL_FAILURE_ID,
    
    GM_UPDATE_STATISTICS_ID = 19,
    GM_GAME_OVER_ID,// mean that game over
    
    GM_RESTART_BTN_TOUCHED_ID = 21,
    GM_RETURN_BTN_TOUCHED_ID,
    GM_NEED_RESTART_GAME_ID,
};
#endif


#endif
