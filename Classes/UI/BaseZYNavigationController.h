//
//  BaseZYNavigationController.h
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

#import <UIKit/UIKit.h>


@interface BaseZYNavigationController : UINavigationController
+(instancetype) zy_instance;
+(instancetype) zy_instance:(UIViewController*) rootViewController;
@end
