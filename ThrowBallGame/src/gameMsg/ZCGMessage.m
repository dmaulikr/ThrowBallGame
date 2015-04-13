//
//  ZCGMessage.m
//  ThrowBallGame
//
//  Created by zhu on 4/11/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGMessage.h"

//static GAME_MSGMAP_ENTRY g_gameMessageEntries[];
//static  GAME_MSGMAP g_gameMessageMap;
//static  const GAME_MSGMAP * GetGameMessageMap();
//
//
//static GAME_MSGMAP_ENTRY g_gameMessageEntries[] =
//{
//    {0,0,0,0}
//};
//
//static GAME_MSGMAP g_gameMessageMap ={(GAME_MSGMAP *)10, g_gameMessageEntries};

static MESSAGE_ARGUMEN_TYPE messageArgument = {0};

static GAME_MSGMAP_ENTRY gameMessageEntries[MESSAGE_ENTRIES_MAX];
static int nMsgEntryCount = 0;

@implementation ZCGMessage

+(void)SetArgument:(const void *)p_argumenSrc withSize:(size_t)st_size
{
    if (st_size <= MESSAGE_ARGUMENT_SIZE) {
        memcpy(&messageArgument, p_argumenSrc, st_size);
    }
    else
    {
        memcpy(&messageArgument, p_argumenSrc, MESSAGE_ARGUMENT_SIZE);
    }
    
}


+(void *)GetArgument
{
    return &messageArgument;
}

+ (void)AddMessage:(id)receiver withSelector:(SEL)_selector withMsgID:(unsigned long)ui_MsgID
{
    //[ZCGMessage AddMessage:receiver withObject1:(id)_selector withObject2:(id)ui_MsgID];
    
    gameMessageEntries[nMsgEntryCount].p_object = receiver;
    gameMessageEntries[nMsgEntryCount]._selector = _selector;
    gameMessageEntries[nMsgEntryCount].ul_messageID = ui_MsgID;
    
    nMsgEntryCount++;
    
    if (nMsgEntryCount >= MESSAGE_ENTRIES_MAX) {
        nMsgEntryCount = 0;
    }
    
    return;
}


+ (void)AddMessage:(id)receiver withObject1:(id)_selector withObject2:(id)id_MsgID
{
    
}

+ (GAME_MSGMAP_ENTRY *)GetMessage:(int)nEntryIndex
{    
    if (nEntryIndex >= nMsgEntryCount) {
        return NULL;
    }
    
    return &gameMessageEntries[nEntryIndex];
}

+(void)ProcessGameMessage:(unsigned long) ul_msgID
{
    GAME_MSGMAP_ENTRY *p_entry;
    int nIndex = 0;
    
    while (1) {
        p_entry = [ZCGMessage GetMessage:nIndex++];
        if (p_entry == NULL) {
            break;
        }
        
        if (p_entry->ul_messageID == ul_msgID) {
            [p_entry->p_object performSelector:p_entry->_selector];
            break;
        }
    }
    
    return;
}


+ (void)PostGameMessage:(unsigned long) ul_msgID
{
    [ZCGMessage ProcessGameMessage:ul_msgID];
    
    return;
}

@end

