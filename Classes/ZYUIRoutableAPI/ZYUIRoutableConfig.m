//
//  ZYUIRoutableConfig.m
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

#import "ZYUIRoutableConfig.h"
#import <UIKit/UIKit.h>
#import "ZYConfig.h"
#import "IZYRouterURLFormater.h"

@implementation ZYUIRoutableConfig

DEF_SINGLETON_INIT(ZYUIRoutableConfig)

-(void) singleInit {
    _defaultNavigationControllerClass = [UINavigationController class];
    
    NSDictionary *config = [[ZYConfig sharedInstance] getConfig:@"ZYUIRoutable"];
    if ([config.allKeys containsObject:@"defaultNavigationController"]) {
        id o = [config objectForKey:@"defaultNavigationController"];
        if ([o isKindOfClass:[NSString class]]) {
            Class clazz = NSClassFromString(o);
            if ([clazz isSubclassOfClass:[UINavigationController class]]) {
                _defaultNavigationControllerClass = clazz;
            }
        }
    }
    if ([config.allKeys containsObject:@"routerURLformatter"]) {
        id o = [config objectForKey:@"routerURLformatter"];
        if ([o isKindOfClass:[NSString class]]) {
            Class clazz = NSClassFromString(o);
            if ([clazz conformsToProtocol:@protocol(IZYRouterURLFormater)]) {
                _routerURLFormatter = clazz;
            }
        }
    }
}

@end
