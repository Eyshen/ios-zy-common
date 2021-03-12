//
//  ZYValidUtils.h
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
//  Created by Eason.zhangyi on 15/8/17.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZY_VALID_IS_TEL(str)                 [ZYValidUtils isTelephone:str]
#define ZY_VALID_IS_MOBILE_PHONE(str)        [ZYValidUtils isMobilephone:str]
#define ZY_VALID_IS_USER_NAME(str)           [ZYValidUtils isUserName:str]
#define ZY_VALID_IS_CHINESE_USER_NAME(str)   [ZYValidUtils isChineseUserName:str]
#define ZY_VALID_IS_CHINESE_NAME(str)        [ZYValidUtils isChineseName:str]
#define ZY_VALID_IS_PASSWORD(str)            [ZYValidUtils isPassword:str]
#define ZY_VALID_IS_EMAIL(str)               [ZYValidUtils isEmail:str]
#define ZY_VALID_IS_URL(str)                 [ZYValidUtils isUrl:str]
#define ZY_VALID_IS_IP_ADDRESS(str)          [ZYValidUtils isIPAddress:str]

/**
 *  验证工具类
 */
@interface ZYValidUtils : NSObject

/**
 *  是否为电话号码
 */
+ (BOOL)isTelephone:(NSString*) str;
/**
 *  是否为手机号
 */
+ (BOOL)isMobilephone:(NSString*) str;

/**
 *  是否为有效用户名(match alphabet 3-20)
 */
+ (BOOL)isUserName:(NSString*) str;

/**
 *  是否为中文名称（包含拼音和汉字）
 */
+ (BOOL)isChineseUserName:(NSString*) str;

/**
 *  是否为中文名称（只匹配汉字）
 */
+ (BOOL)isChineseName:(NSString*) str;

/**
 *  是否为密码（6-20位）
 */
+ (BOOL)isPassword:(NSString*) str;

/**
 *  是否为邮箱
 */
+ (BOOL)isEmail:(NSString*) str;

/**
 *  是否为URL
 */
+ (BOOL)isUrl:(NSString*) str;

/**
 *  是否为ip地址
 */
+ (BOOL)isIPAddress:(NSString*) str;


@end
