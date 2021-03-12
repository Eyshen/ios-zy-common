//
//  NSNotificationCenter+ZYExtension.m
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

#import "NSNotificationCenter+ZYExtension.h"

@implementation NSNotificationCenter (ZYExtension)

+(void)zy_postNotificationOnMainThread:(NSNotification *)notification {
    if ([NSThread isMainThread]) return [self zy_postNotification:notification];
    [self zy_postNotificationOnMainThread:notification waitUntilDone:NO];
}

+(void)zy_postNotificationOnMainThread:(NSNotification *)notification
                      waitUntilDone:(BOOL)wait {
    if ([NSThread isMainThread]) return [self zy_postNotification:notification];
    [self performSelectorOnMainThread:@selector(zy_postNotification:) withObject:notification waitUntilDone:wait];
}

+(void)zy_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object {
    if ([NSThread isMainThread]) {
        return [[self defaultCenter] postNotificationName:name object:object];
    }
    [self zy_postNotificationOnMainThreadWithName:name object:object userInfo:nil waitUntilDone:NO];
}

+(void)zy_postNotificationOnMainThreadWithName:(NSString *)name
                                     object:(id)object
                                   userInfo:(NSDictionary *)userInfo {
    if ([NSThread isMainThread]) {
        return [[self defaultCenter] postNotificationName:name object:object userInfo:userInfo];
    }
    [self zy_postNotificationOnMainThreadWithName:name object:object userInfo:userInfo waitUntilDone:NO];
}


+(void)zy_postNotificationOnMainThreadWithName:(NSString *)name
                                     object:(id)object
                                   userInfo:(NSDictionary *)userInfo
                              waitUntilDone:(BOOL)wait {
    if ([NSThread isMainThread]) {
        return [[self defaultCenter] postNotificationName:name object:object userInfo:userInfo];
    }
    NSMutableDictionary *info = [[NSMutableDictionary allocWithZone:nil] initWithCapacity:3];
    if (name) [info setObject:name forKey:@"name"];
    if (object) [info setObject:object forKey:@"object"];
    if (userInfo) [info setObject:userInfo forKey:@"userInfo"];
    [self performSelectorOnMainThread:@selector(zy_postNotificationName:) withObject:info waitUntilDone:wait];
}

+(void) zy_postNotification:(NSNotification *)notification {
    [[self defaultCenter] postNotification:notification];
}

+(void) zy_postNotificationName:(NSDictionary *)info {
    NSString *name = [info objectForKey:@"name"];
    id object = [info objectForKey:@"object"];
    NSDictionary *userInfo = [info objectForKey:@"userInfo"];
    [[self defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

@end
