//
//  NSNotificationCenter+ZYExtension.h
//
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/1/4.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

//POST
#define ZY_NOTIFY_POST(notification)                                        [NSNotificationCenter zy_postNotificationOnMainThread:notification]
#define ZY_NOTIFY_POST_WAIT(notification,wait)                              [NSNotificationCenter zy_postNotificationOnMainThread:notification waitUntilDone:wait]
#define ZY_NOTIFY_POST_NAME_OBJECT(name,object)                             [NSNotificationCenter zy_postNotificationOnMainThreadWithName:name object:object]
#define ZY_NOTIFY_POST_NAME_OBJECT_USERINFO(name,object,userInfo)           [NSNotificationCenter zy_postNotificationOnMainThreadWithName:name object:object userInfo:userInfo]
#define ZY_NOTIFY_POST_NAME_OBJECT_USERINFO_WAIT(name,object,userInfo,wait) [NSNotificationCenter zy_postNotificationOnMainThreadWithName:name object:object userInfo:userInfo waitUntilDone:wait]

//REMOVE
#define ZY_NOTIFY_REMOVE(observer)                                          [[NSNotificationCenter defaultCenter] removeObserver:observer]
#define ZY_NOTIFY_REMOVE_NAME_OBJECT(observer,name,object)                  [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object]

//ADD
#define ZY_NOTIFY_ADD_OBSERVER(observer,selector,name,object)               [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object]

@interface NSNotificationCenter (ZYExtension)

+(void) zy_postNotificationOnMainThread:(NSNotification *)notification;

+(void) zy_postNotificationOnMainThread:(NSNotification *)notification
                         waitUntilDone:(BOOL)wait;

+(void) zy_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(id)object;

+(void) zy_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(id)object
                                    userInfo:(NSDictionary *)userInfo;

+(void) zy_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(id)object
                                    userInfo:(NSDictionary *)userInfo
                               waitUntilDone:(BOOL)wait;



@end
