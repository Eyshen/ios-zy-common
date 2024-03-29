//
//  IZYJSONObject.h
//
//     ___________ __      __
//    /\______   / \ \    / /
//    \/___  /  /   \ \  / /
//        / /  /     \ \/ /
//       / /  /       |  |
//      / /  /______  |  |
//     / /__________\ |__|
//
//  Created by Eason.zhang on 15/9/9.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Json对象协议，所有需要解析的对象必须实现此协议
 */
@protocol IZYJSONObject <NSObject>

/**
 *  属性到Json属性的映射
 */
+(NSDictionary*) zyPropertyToJsonPropertyDictionary;

/**
 *  非Json属性列表
 */
+(NSSet*) zyNonJsonPropertys;

/**
 *  容器属性类型
 *  key：属性名称
 *  value：类型（Class）支持NSDictionary，NSSet，NSArray   
 *  {
 *      @"users" : [UserDTO class],
 *      @"dict" : {
 *                   @"key1" : [DTOClass1 class],
 *                   @"key2" : [DTOClass2 class]
 *                }
 *  }
 */
+(NSDictionary*) zyContainerPropertysGenericClass;

/**
 *  日期属性Format字符串
 */
+(NSString*) zyPropertyDateFormatString:(NSString*) property;

/**
 *  自定义解析属性集合
 *
 *  @return 数据名称集合
 */
+(NSSet*) zyCustomParsePropertys;

/**
 *  自定义处理属性（只有zyCustomParsePropertys返回有属性需要自定义处理时才触发）
 *
 *  @param property 属性名称
 *  @param object   对应值
 */
-(void) zyCustomParseProperty:(NSString*) property value:(id) object;

@end
