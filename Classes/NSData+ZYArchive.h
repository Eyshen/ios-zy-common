//
//  NSData+ZYArchive.h
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

#import <Foundation/Foundation.h>

/**
 *  存档扩展
 */
@interface NSData (ZYArchive)

/**
 *  将普通NSCoding转成NSData
 */
+(NSData*) archivedDataWithRootObject:(id) object;

/**
 *  将NSData反序列化成NSCoding对象
 */
+(id) unarchiveObjectWithData:(NSData*) data;

@end
