//
//  IZYRouterViewController.h
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
//  Created by 张一 on 15/8/21.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IZYRouterViewControllerDelegate.h"

/**
 路由视图控制器接口
 */
@protocol IZYRouterViewController <IZYRouterViewControllerDelegate>

/**
 *  回调委托
 */
@property (nonatomic, weak) id<IZYRouterViewControllerDelegate> routerDelegate;

/**
 *  路由视图控制器初始化方法
 *
 *  @param params   参数
 *  @param delegate 委托
 *
 *  @return 视图控制器
 */
-(id) initWithURL:(NSString*) URL routerParams:(NSDictionary*) params;

@end
