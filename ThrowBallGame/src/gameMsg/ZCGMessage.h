//
//  ZCGMessage.h
//  ThrowBallGame
//
//  Created by zhu on 4/11/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef _GAME_MESSAGE_
#define _GAME_MESSAGE_

#define MESSAGE_ENTRIES_MAX 100
#define MESSAGE_ARGUMENT_SIZE 50

typedef struct _GAME_MSGMAP_ENTRY_
{
    id  p_object;
    SEL _selector; 
    unsigned long ul_messageID;
}GAME_MSGMAP_ENTRY, *P_GAME_MSGMAP_ENTRY;

typedef struct _GAME_MSGMAP_
{
    const struct _GAME_MSGMAP_ *p_baseGameMessageMap;
    GAME_MSGMAP_ENTRY *p_entries;
}GAME_MSGMAP, *P_GAME_MSGMAP;


#ifndef _MESSAGE_ARGUMEN_TYPE_
#define _MESSAGE_ARGUMEN_TYPE_
typedef struct _MESSAGE_ARGUMEN_TYPE_
{
    unsigned char messageArgument[MESSAGE_ARGUMENT_SIZE];
}MESSAGE_ARGUMEN_TYPE, *P_MESSAGE_ARGUMEN_TYPE;

#endif // end #ifndef _MESSAGE_ARGUMEN_TYPE_


#define  DECLARE_GAME_MESSAGE(_class)\
@interface _class (GAME_MESSAGE)\
{}\
- (void)AddGameMessage;\
@end

// begin game message acro
#define BEGIN_GAME_MESSAGE(_class)\
DECLARE_GAME_MESSAGE(_class)\
@implementation _class (GAME_MESSAGE)\
- (void)AddGameMessage\
{

// end game message acro
#define END_GAME_MESSAGE()\
}\
@end

// add an game message acro
#define ADD_GAME_MSG(method, msgID)\
[ZCGMessage AddMessage:(self) withSelector:@selector(method) withMsgID:(msgID)];

// init game message
// this acro should be put into the class init method
#define INIT_GAME_MESSAGE()\
[self AddGameMessage];


#endif //  end #ifndef _GAME_MESSAGE_


/*
 the message acro can be used like this:
 first declare and implement 
 BEGIN_GAME_MESSAGE(ZCGGame)
 ADD_GAME_MSG(TouchViewClicked, GM_TOUCH_VIEW_TOUCHED_ID)
 END_GAME_MESSAGE()
 TouchViewClicked is a member method of the class ZCGGame
 
 second initialize int the class ZCGGame init method or other init method
 INIT_GAME_MESSAGE()
*/


@interface ZCGMessage : NSObject
{
    
}
+ (void)AddMessage:(id)receiver withSelector:(SEL)_selector withMsgID:(unsigned long)ui_MsgID;
+ (void)AddMessage:(id)receiver withObject1:(id)_selector withObject2:(id)id_MsgID;
+ (GAME_MSGMAP_ENTRY *)GetMessage:(int)nEntryIndex;
+ (void)PostGameMessage:(unsigned long) ul_msgID;
+ (void)ProcessGameMessage:(unsigned long) ul_msgID;
+ (void)SetArgument:(const void *)p_argumenSrc withSize:(size_t)st_size;
+ (void *)GetArgument;
@end




















