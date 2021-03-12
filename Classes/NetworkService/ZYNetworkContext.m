//
//  ZYNetworkContext.m
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

#import "ZYNetworkContext.h"
#import "ZYNetworkContextConfig.h"

@implementation ZYNetworkContext

DEF_SINGLETON_INIT(ZYNetworkContext)

-(BOOL)isConnection {
    return [self currentStatus] != NotReachable;
}

-(NetworkStatus) currentStatus {
    return [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
}

-(void) addNotification:(id) target selector:(SEL) selector {
    if (target != nil && selector != NULL) {
        [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:kReachabilityChangedNotification object:nil];
    }
}
-(void) removeNotification:(id)target {
    if (target) {
        [[NSNotificationCenter defaultCenter] removeObserver:target name:kReachabilityChangedNotification object:nil];
    }
}

-(void)singleInit {
    NSString *host = [[ZYNetworkContextConfig sharedInstance] serverHost];
    
    if (host) {
        Reachability *reachability = [Reachability reachabilityWithHostname:host];
        [reachability startNotifier];
    } else {
        Reachability *reachability = [Reachability reachabilityForInternetConnection];
        [reachability startNotifier];
    }
}


@end
