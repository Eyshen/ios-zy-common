//
//  ZYLogger.h
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

#import <Foundation/Foundation.h>
#import "IZYLogger.h"
#import "CocoaLumberjack.h"
/**
 *  日志记录器
 *  使用方法
 *  1、声明静态变量 ddLogLevel
 *  #ifdef DEBUG
 *       static const DDLogLevel ddLogLevel = DDLogLevelInfo;
 *   #else
 *       static const DDLogLevel ddLogLevel = DDLogLevelError;
 *   #endif
 */

#ifdef DEBUG
    static const DDLogLevel ddLogLevel = DDLogLevelAll;
#else
    static const DDLogLevel ddLogLevel = DDLogLevelOff;
#endif


@interface ZYLogger : NSObject<IZYLogger>

@end
