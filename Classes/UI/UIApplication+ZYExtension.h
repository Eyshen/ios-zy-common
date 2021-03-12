//
//  UIApplication+ZYExtension.h
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
//  Created by Eason.zhangyi on 16/1/5.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZY_APPLICATION_DELEGATE                 [UIApplication appDelegate]
#define ZY_APPLICATION_WINDOW                   [UIApplication appWindow]
#define ZY_APPLICATION_ROOT_VIEWCONTROLLER      [UIApplication appRootViewController]
#define ZY_APPLICATION_IDENTIFIER               [UIApplication appIdentifier]
#define ZY_APPLICATION_VERSION                  [UIApplication appVersion]
#define ZY_APPLICATION_SHORT_VERSION            [UIApplication appShortVersion]
#define ZY_APPLICATION_SCHEME                   [UIApplication appScheme]
#define ZY_APPLICATION_SCHEME_BY_NAME(name)     [UIApplication appScheme:name]


@interface UIApplication (ZYExtension)

/**
 *  应用程序委托
 */
+(id<UIApplicationDelegate>) appDelegate;

/**
 *  应用程序Window
 */
+(UIWindow*) appWindow;

/**
 *  应用程序主视图控制器
 */
+(UIViewController*) appRootViewController;

/**
 *  应用程序Bundle Identifier
 */
+ (NSString*) appIdentifier;

/**
 *  应用程序版本
 */
+ (NSString *)appVersion;

/**
 *  应用程序short version
 */
+ (NSString *)appShortVersion;

/**
 *  应用程序Scheme
 */
+ (NSString *)appScheme;

+ (NSString *)appScheme:(NSString *)name;

@end
