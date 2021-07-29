//
//  IZYRouterURLFormater.h
//  ZYUIRoutable-example
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by 张一 on 17/5/22.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IZYRouterURLFormater <NSObject>

- (NSString*)formatRouterURL:(NSString*)routerURL;

@end
