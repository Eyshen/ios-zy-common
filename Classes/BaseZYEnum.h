//
//  BaseZYEnum.h
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
//  Created by Eason.zhangyi on 15/11/25.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "BaseZYObject.h"

/**
 * 枚举类型基类
 * 使用方法：
 *  1、继承BaseZYEnum基类
 *  2、子类中.m文件中声明一个 NSSet集合类型，并重写方法 +(NSSet)values 返回此集合
 *  3、在+(void)load 中初始化枚举项
 *  4、每个枚举类型构造一个可读属性，并实现属性get方法
 */



@protocol IZYEnum <NSObject>

+(NSSet*) values;//枚举列表

+(id<IZYEnum>) getEnumByValue:(NSInteger) value;

-(NSInteger) value;//值

-(NSString*) name;//名称

@end

#define ENUMINIT(v,n)       [[self.class alloc] initWithValue:v name:n]
/**
 *  枚举基类
 */
@interface BaseZYEnum : BaseZYObject<IZYEnum>

-(instancetype) initWithValue:(NSInteger) value name:(NSString*) name;

@end
