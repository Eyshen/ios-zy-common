//
//  ZYNetworkActivityManager.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//  Created by Eason.zhangyi on 16/7/30.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYSingleton.h"

@interface ZYNetworkActivityService : NSObject

AS_SINGLETON(ZYNetworkActivityService)

/**
 *  开始让状态栏中的数据标示旋转
 */
-(void)start;

/**
 *  停止让状态栏中的数据标示旋转
 */
-(void)stop;

/**
 *  立即停止状态栏中的数据标示旋转
 */
-(void)stopAll;

@end
