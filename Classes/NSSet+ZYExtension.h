//
//  NSSet+ZYExtension.h
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
 *  集合扩展
 */
@interface NSSet (ZYExtension)

/**
 *  第一个元素
 */
@property(readonly) id zy_first;

/**
 *  最后一个元素
 */
@property(readonly) id zy_last;

/**
 * 随机一个元素
 */
@property(readonly) id zy_sample;

/**
 *  遍历集合元素
 *
 *  @param block 遍历block
 */
- (void) zy_each:(void (^)(id object))block;

/**
 *  遍历集合元素
 *
 *  @param block 遍历block
 */
- (void) zy_eachWithIndex:(void (^)(id object, NSUInteger index))block;

/**
 *  筛选集合元素
 *
 *  @param block 筛选block
 *
 *  @return 筛选结果
 */
- (NSArray *) zy_select:(BOOL (^)(id object))block;

/**
 *  与qw_select 相反
 */
- (NSArray *) zy_reject:(BOOL (^)(id object))block;

/**
 *  将集合元素转成想要对象
 */
- (NSArray *) zy_map:(id (^)(id object))block;

/**
 *  排序集合
 *
 *  @return 排序结果
 */
- (NSArray *) zy_sort;


@end
