//
//  ZYLogger.m
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

#import "ZYLogger.h"

@implementation ZYLogger

-(void) error:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogError(@"[ERROR] %@ %@",func, message);
        va_end(args);
    }
}

-(void) warn:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogWarn(@"[WARN] %@ %@",func, message);
        va_end(args);
    }
}

-(void) info:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogInfo(@"[INFO] %@ %@",func, message);
        va_end(args);
    }
}

-(void) debug:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogDebug(@"[DEBUG] %@ %@",func, message);
        va_end(args);
    }
}

-(void) verbose:(NSString*) func format:(NSString*) format, ... {
    va_list args;
    if (format) {
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        DDLogVerbose(@"[VERBOSE] %@ %@",func, message);
        va_end(args);
    }
}
@end
