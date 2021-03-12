//
//  BaseZYTabBarController.m
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 15/8/6.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "BaseZYTabBarController.h"

@implementation BaseZYTabBarController

+(instancetype)zy_instance {
    BaseZYTabBarController *tabBarController = nil;
    @try {
        NSString *className = NSStringFromClass(self);
        NSString *nibFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.nib",className]];
        NSString *iphoneNibFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@~iphone.nib",className]];
        NSString *ipadNibFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@~ipad.nib",className]];
        if ([[NSFileManager defaultManager] fileExistsAtPath:iphoneNibFilePath] || [[NSFileManager defaultManager] fileExistsAtPath:nibFilePath] || [[NSFileManager defaultManager] fileExistsAtPath:ipadNibFilePath]) {
            tabBarController = [[self alloc] initWithNibName:className bundle:[NSBundle mainBundle]];
        } else {
            tabBarController = [[self alloc] init];
        }
    }
    @catch (NSException *exception) {
        tabBarController = [[self alloc] init];
    }
    return tabBarController;
}

@end
