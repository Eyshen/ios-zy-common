//
//  ZYNetworkContext.h
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
//  Created by Eason.zhangyi on 16/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "ZYSingleton.h"


/**
 *  网络环境工具类
 */
@interface ZYNetworkContext : NSObject

AS_SINGLETON(ZYNetworkContext)

/**
 *  是否已联网
 *
 *  @return 联网结果
 */
-(BOOL) isConnection;

/**
 *  当前网络状态
 *
 *  @return 状态值
 */
-(NetworkStatus) currentStatus;

/**
 *  添加网络变化通知
 *
 *  @param target
 *  @param selector
 */
-(void) addNotification:(id) target selector:(SEL) selector;

/**
 *  删除网络变化通知
 *
 *  @param target
 */
-(void) removeNotification:(id) target;


@end
