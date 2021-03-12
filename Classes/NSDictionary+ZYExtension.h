//
//  NSDictionary+ZYExtension.h
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
//  Created by Eason.zhangyi on 15/12/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  词典扩展
 */
@interface NSDictionary (ZYExtension)
/**
 *  遍历词典
 *
 *  @param block 遍历block
 */
- (void) zy_each:(void (^)(id key, id value))block;

/**
 *  遍历词典所有key
 *
 *  @param block 遍历block
 */
- (void) zy_eachKey:(void (^)(id key))block;

/**
 *  遍历词典所有值
 *
 *  @param block 遍历block
 */
- (void) zy_eachValue:(void (^)(id value))block;

/**
 *  转换词典
 */
- (NSArray *) zy_map:(id (^)(id key, id value))block;

/**
 *  是否存在key
 *
 *  @param key key
 *
 *  @return 是否存在
 */
- (BOOL) zy_hasKey:(id)key;

@end
