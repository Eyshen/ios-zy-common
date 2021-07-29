//
//  ZYUIRoutableConfig.h
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
//  Created by 张一 on 15/12/25.
//  Copyright © 2015年 ZY. All rights reserved.
//

//#import "AbstractZYBusinessObject.h"
#import "ZYSingleton.h"
/**
 *  UI路由配置
 */
@interface ZYUIRoutableConfig : NSObject

AS_SINGLETON(ZYUIRoutableConfig)

/**
 *  默认导航视图控制器
 *  Default UINavigationController
 */
@property(nonatomic, readonly) Class defaultNavigationControllerClass;

/**
 *  默认导航视图控制器
 */
@property(nonatomic, readonly) Class routerURLFormatter;

@end
