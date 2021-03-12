//
//  BaseZYNavigationBar.m
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.

#import "BaseZYNavigationBar.h"

@implementation BaseZYNavigationBar

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    for (UIView *view in self.subviews) {
        if([NSStringFromClass([view class]) containsString:@"Background"]) {
            [view setFrame:self.bounds];
        } else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
            [view setFrame:CGRectMake(0, statusBarHeight, self.bounds.size.width, self.bounds.size.height-statusBarHeight)];
        }
    }
}
#endif

@end
