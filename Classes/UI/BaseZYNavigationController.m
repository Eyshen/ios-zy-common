//
//  BaseZYNavigationController.m
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

#import "BaseZYNavigationController.h"

@implementation BaseZYNavigationController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  默认隐藏导航栏
     */
    [self setNavigationBarHidden:YES];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0f) {
        if (self.isViewLoaded && !self.view.window) {
            self.view = nil;
        }
    }
#endif
    
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}

+(instancetype) zy_instance {
    BaseZYNavigationController *instance = [[self alloc] init];
    return instance;
}

+(instancetype) zy_instance:(UIViewController*) rootViewController {
    if (rootViewController) {
        BaseZYNavigationController *instance = [[self alloc] initWithRootViewController:rootViewController];
        return instance;
    }
    return [self zy_instance];
}

-(BOOL)shouldAutorotate {
    return NO;
}

@end
