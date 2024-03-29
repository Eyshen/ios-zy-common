//
//  ZYFileUtilss.h
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
#import <UIKit/UIKit.h>

#define ZY_FILE_DIR_DOCUMENT                        [ZYFileUtils documentDir]
#define ZY_FILE_DIR_TMP                             [ZYFileUtils tmpDir]
#define ZY_FILE_DIR_APP                             [ZYFileUtils appDir]
#define ZY_FILE_DIR_CACHE                           [ZYFileUtils cacheDir]
#define ZY_FILE_SIZE(filePath)                      [ZYFileUtils fileSize:filePath]
#define ZY_FILE_DELETE(filePath)                    [ZYFileUtils deleteFile:filePath]
#define ZY_FILE_EXIST(filePath)                     [ZYFileUtils existFile:filePath]
#define ZY_FILE_READ(filePath)                      [ZYFileUtils readFileByPath:filePath]
#define ZY_FILE_WRITE(data,filePath,replace)        [ZYFileUtils writeFile:data forPath:filePath replace:replace]
#define ZY_FILE_COPY(filePath,targetPath)           [ZYFileUtils copyFile:filePath target:targetPath]
#define ZY_FILE_MOVE(filePath,targetPath)           [ZYFileUtils moveFile:filePath target:targetPath]
#define ZY_FILE_WRITE_JPEG(image,quality,forPath)   [ZYFileUtils writeJPEGImage:image quality:quality forPath:forPath]
#define ZY_FILE_WRITE_PNG(image,filePath)           [ZYFileUtils writePNGImage:image forPath:filePath]

/**
 *  文件操作工具类
 */
@interface ZYFileUtils : NSObject

/**
 *  应用程序文档目录
 *
 *  @return 文档目录
 */
+ (NSString *) documentDir;

/**
 *  应用程序临时文件路径
 *
 *  @return 临时文件路径
 */
+ (NSString *) tmpDir;

/**
 *  获得应用程序目录
 *
 *  @return 应用程序根目录
 */
+ (NSString *) appDir;

/**
 *  应用程序缓存目录
 *
 *  @return 缓存目录
 */
+ (NSString *) cacheDir;

/**
 *  读取文件
 *
 *  @param filePath 文件地址
 *
 *  @return 文件NSData
 */
+ (NSData*) readFileByPath:(NSString*) filePath;

/**
 *  写入文件
 *
 *  @param fileData 文件NSData
 *  @param filePath 文件路径
 *  @param replace  如果文件存在是否替换
 *
 *  @return 是否成功
 */
+ (BOOL) writeFile:(NSData*) fileData forPath:(NSString *) filePath replace:(BOOL) replace;

/**
 *  保存一个jpg图片到本地
 *
 *  @param image              图片
 *  @param compressionQuality 图片质量
 *  @param filePath           文件路径
 *
 *  @return 是否成功
 */
+ (BOOL) writeJPEGImage:(UIImage *) image quality:(CGFloat) compressionQuality forPath:(NSString *) filePath;

/**
 *  保存一个png图片到本地
 *
 *  @param image    图片
 *  @param filePath 文件路径
 *
 *  @return 是否成功
 */
+ (BOOL) writePNGImage:(UIImage *) image forPath:(NSString*) filePath;

/**
 *  删除文件
 *
 *  @param filePath 文件路径
 *
 *  @return 是否成功
 */
+ (BOOL) deleteFile:(NSString*) filePath;

/**
 *  是否存在此文件
 *
 *  @param filePath 文件路径
 *
 *  @return 是否存在
 */
+ (BOOL) existFile:(NSString*) filePath;

/**
 *  移动文件
 *
 *  @param filePath       源文件路径
 *  @param targetFilePath 目标文件路径
 *
 *  @return 是否成功
 */
+ (BOOL) moveFile:(NSString*) filePath target:(NSString*) targetPath;

/**
 *  拷贝文件
 *
 *  @param filePath       源文件路径
 *  @param targetFilePath 目标文件路径
 *
 *  @return 是否成功
 */
+ (BOOL) copyFile:(NSString*) filePath target:(NSString*) targetPath;

/**
 *  文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 文件大小（字节）
 */
+ (long long) fileSize:(NSString*) filePath;

@end
