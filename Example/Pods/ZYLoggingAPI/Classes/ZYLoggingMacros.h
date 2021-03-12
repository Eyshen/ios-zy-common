//
//  ZYLoggingMacros.h
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
//  Created by 张一 on 16-12-26.
//  Copyright (c) 2016年 ZY. All rights reserved.
//


/**
 * 日志入口
 * error > warn > info > debug > verbose
 */

#import "IZYLogger.h"
#import "ZYLoggerFactory.h"

#define ZYLogError(frmt, ...) \
        [[ZYLoggerFactory getLogger] error:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define ZYLogWarn(frmt, ...) \
        [[ZYLoggerFactory getLogger] warn:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define ZYLogInfo(frmt, ...) \
        [[ZYLoggerFactory getLogger] info:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define ZYLogDebug(frmt, ...) \
        [[ZYLoggerFactory getLogger] debug:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]

#define ZYLogVerbose(frmt, ...) \
        [[ZYLoggerFactory getLogger] verbose:[NSString stringWithFormat:@"%s line:%d",__func__,__LINE__] format:frmt, ##__VA_ARGS__]
