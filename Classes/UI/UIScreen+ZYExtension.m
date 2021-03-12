//
//  UIScreen+ZYE.m
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

#import "UIScreen+ZYExtension.h"

@implementation UIScreen (ZYExtension)

+(CGRect) bounds {
    return [[UIScreen mainScreen] bounds];
}

+(CGRect) applicationFrame {
    return [[UIScreen mainScreen] applicationFrame];
}

+(CGFloat) width {
    return [[UIScreen mainScreen] bounds].size.width;
}

+(CGFloat) height {
    return [[UIScreen mainScreen] bounds].size.height;
}

+(CGFloat) scale {
    return [[UIScreen mainScreen] scale];
}

+(CGSize) size {
    return [[UIScreen mainScreen] bounds].size;
}

@end
