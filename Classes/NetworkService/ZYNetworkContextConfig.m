//
//  ZYNetworkContextConfig.m
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
//  Created by 张一 on 16-12-27.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "ZYNetworkContextConfig.h"

@implementation ZYNetworkContextConfig

DEF_SINGLETON(ZYNetworkContextConfig)


-(void)setCheckServerHost:(NSString *)host {
    if (host) {
        _serverHost = [host copy];
    }
}

@end
