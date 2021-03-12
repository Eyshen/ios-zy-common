//
//  ZYSecurityUtils.h
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
//  Created by Eason.zhangyi on 15/7/30.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZY_SECURITY_MD2(D)                  [ZYSecurityUtils MD2:D]
#define ZY_SECURITY_MD4(D)                  [ZYSecurityUtils MD4:D]
#define ZY_SECURITY_MD5(D)                  [ZYSecurityUtils MD5:D]
#define ZY_SECURITY_SHA1(D)                 [ZYSecurityUtils SHA1:D]
#define ZY_SECURITY_SHA224(D)               [ZYSecurityUtils SHA224:D]
#define ZY_SECURITY_SHA256(D)               [ZYSecurityUtils SHA256:D]
#define ZY_SECURITY_SHA384(D)               [ZYSecurityUtils SHA384:D]
#define ZY_SECURITY_SHA512(D)               [ZYSecurityUtils SHA512:D]
#define ZY_SECURITY_HEXADEDIMAL(D)          [ZYSecurityUtils hexadedimalString:D]
#define ZY_SECURITY_ENCODING_BASE64(D)      [ZYSecurityUtils base64:D]
#define ZY_SECURITY_DECODE_BASE64(D)        [ZYSecurityUtils dataWithBase64:D]
#define ZY_SECURITY_HMACMD5(C,K)            [ZYSecurityUtils HMACMD5:C secretKey:K]
#define ZY_SECURITY_HMACSHA256(C,K)         [ZYSecurityUtils HMACSHA256:C secretKey:K]
#define ZY_SECURITY_DES_ENCRY(C,K)          [ZYSecurityUtils desEncrypt:C secretKey:K]
#define ZY_SECURITY_DES_DECRY(C,K)          [ZYSecurityUtils desDecrypt:C secretKey:K]
/**
 *  安全工具类
 */
@interface ZYSecurityUtils : NSObject

/**
 *  MD2 散列
 */
+ (NSString *) MD2:(NSData*) data;

/**
 *  MD4 散列
 */
+ (NSString *) MD4:(NSData*) data;

/**
 *  MD5 散列
 */
+ (NSString *) MD5:(NSData*) data;

/**
 *  SHA1 散列
 */
+ (NSString *) SHA1:(NSData*) data;

+ (NSString *) SHA224:(NSData*) data;

+ (NSString *) SHA256:(NSData*) data;

+ (NSString *) SHA384:(NSData*) data;

+ (NSString *) SHA512:(NSData*) data;

/**
 *  将NSData转换成十六进制字符串
 *
 *  @param data 数据
 *
 *  @return 字符串
 */
+ (NSString *)hexadedimalString:(NSData*) data;

+ (NSString *)base64:(NSData*) data;

+ (NSData *)dataWithBase64:(NSString *)base64String;




/**
 *  HMAC MD5
 *
 *  @param content 需要加密内容
 *  @param secret  密钥
 *
 *  @return 结果
 */
+ (NSString *)HMACMD5:(NSString*)content secretKey:(NSString*)secret;

/**
 *  HMAC SHA256
 *
 *  @param content 需要加密内容
 *  @param secret  密钥
 *
 *  @return 结果
 */
+ (NSString *)HMACSHA256:(NSString*)content secretKey:(NSString*)secret;

//des加密
+(NSData *)desEncrypt:(NSData *)data secretKey:(NSString *)secretKey;

//des解密
+(NSData *)desDecrypt:(NSData *)data secretKey:(NSString *)secretKey;

@end
