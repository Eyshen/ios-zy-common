//
//  NSData+ZYArchive.m
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
//  Created by Eason.zhangyi on 16/1/12.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "NSData+ZYArchive.h"
#import "ZYLoggingMacros.h"

@implementation NSData (ZYArchive)

+(NSData *)archivedDataWithRootObject:(id)object {
    NSData *data = nil;
    if (object) {
        @try {
            if ([[object class] conformsToProtocol:@protocol(NSCoding)]) {
                data = [NSKeyedArchiver archivedDataWithRootObject:object];
            } else {
                ZYLogError(@"%@没有实现NSCoding协议",NSStringFromClass([object class]));
            }
        }
        @catch (NSException *exception) {
            data = nil;
            ZYLogError(@"异常:%@",exception);
        }
    }
    return data;
}

+(id)unarchiveObjectWithData:(NSData *)data {
    id result = nil;
    if (data && [data length] > 0) {
        @try {
            result = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        @catch (NSException *exception) {
            result = nil;
            ZYLogError(@"异常:%@",exception);
        }
    }
    return result;
}

@end
