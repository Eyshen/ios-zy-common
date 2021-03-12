//
//  IZYRouterViewControllerCallback.h
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

/**
 *  委托回调
 */
@protocol IZYRouterViewControllerDelegate <NSObject>

/**
 *  试图控制器间回调委托
 *  回调委托
 */
-(void) viewController:(UIViewController*) viewController routerParams:(NSDictionary*) params;

@end
