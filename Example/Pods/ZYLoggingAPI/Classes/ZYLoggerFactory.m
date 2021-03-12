//
//  ZYLoggerFactory.m
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
//  Created by 张一 on 16-12-13.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "ZYLoggerFactory.h"

@implementation ZYLoggerFactory

static id<IZYLogger> logger = nil;

+(id<IZYLogger>) getLogger {
    static dispatch_once_t loggerOnceToken;
    dispatch_once(&loggerOnceToken, ^{
        Class clazz = NSClassFromString(@"ZYLogger");
        if (clazz) {
            if ([clazz conformsToProtocol:@protocol(IZYLogger)]) {
                logger = [[clazz alloc] init];
            } else {
                NSString *reason = [NSString stringWithFormat:@"无法创建Logger,因为 ZYLogger 没有实现协议IZYLogger"];
                @throw [NSException exceptionWithName:@"ZYLoggerFactoryException" reason:reason userInfo:@{@"ZYLoggerClassName":@"ZYLogger"}];
            }
        }
    });
    return logger;
}

@end
