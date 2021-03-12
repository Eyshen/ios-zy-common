//
//  ILogger.h
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

/**
 * 日志记录器接口
 * error > warn > info > debug > verbose
 */
@protocol IZYLogger <NSObject>

/**
 *  error 级别日志
 */
-(void) error:(NSString*) func format:(NSString*) format, ...;

/**
 *  warn 级别日志
 */
-(void) warn:(NSString*) func format:(NSString*) format, ...;

/**
 *  info 级别日志
 */
-(void) info:(NSString*) func format:(NSString*) format, ...;

/**
 *  debug 级别日志
 */
-(void) debug:(NSString*) func format:(NSString*) format, ...;

/**
 *  verbose 级别日志
 */
-(void) verbose:(NSString*) func format:(NSString*) format, ...;

@end
