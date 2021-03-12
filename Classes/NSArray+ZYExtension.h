//
//  NSArray+ZYExtension.h
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

@interface NSArray (ZYExtension)

/**
 *  第一个元素
 */
- (id) zy_first;

/**
 *  最后一个元素
 */
- (id) zy_last;


/**
 *  随机一个元素
 */
- (id) zy_sample;


/**
 * 根据下标返回元素列表
 */
- (id) zy_objectForKeyedSubscript:(id <NSCopying>)key;


/**
 * 遍历所有元素
 */
- (void) zy_each:(void (^)(id object))block;

/**
 * 遍历所有元素
 */
- (void) zy_eachWithIndex:(void (^)(id object, NSUInteger index))block;

/**
 *  是否包含此元素
 */
- (BOOL) zy_includes:(id)object;

/**
 *  返回指定数量的元素
 */
- (NSArray *) zy_take:(NSUInteger)numberOfElements;

/**
 *  根据条件返回元素
 */
- (NSArray *) zy_takeWhile:(BOOL (^)(id object))block;

/**
 *  遍历整个数组
 */
- (NSArray *) zy_map:(id (^)(id object))block;

/**
 *  根据条件返回数据
 */
- (NSArray *) zy_select:(BOOL (^)(id object))block;

/**
 *  查找元素
 */
- (id) zy_detect:(BOOL (^)(id object))block;


/**
 *  查找元素
 */
- (id) zy_find:(BOOL (^)(id object))block;

/**
 *  不符合条件数组
 */
- (NSArray *) zy_reject:(BOOL (^)(id object))block;

/**
 *  将数组中所有是数组的元素全部作为一个数组返回
 */
- (NSArray *) zy_flatten;

/**
 *  将数组连接成字符串
 */
- (NSString *) zy_join;

/**
 *  根据指定字符连接数组
 */
- (NSString *) zy_join:(NSString *)separator;

/**
 *  排序（compare:）
 */
- (NSArray *) zy_sort;

/**
 *  根据指定字段排序
 */
- (NSArray *) zy_sortBy:(NSString*)key;

/**
 *  翻转字符串
 */
- (NSArray *) zy_reverse;

/**
 *  查找在array中的数组元素
 *
 *  @param array 条件数组
 *
 *  @return 在array数据中的数据集合
 */
- (NSArray *) zy_intersectionWithArray:(NSArray *)array;

/**
 *  合并两个数组
 */
- (NSArray *) zy_unionWithArray:(NSArray *)array;

/**
 *  筛选不在array中的数据元素
 *
 *  @param array 条件数组
 *
 *  @return 不在array中的数据集合
 */
- (NSArray *) zy_relativeComplement:(NSArray *)array;

/**
 *  补集，不同时在当前数组和array中的元素集合
 *
 *  @param array 条件数组
 *
 *  @return 补集结果
 */
- (NSArray *) zy_symmetricDifference:(NSArray *)array;

@end
