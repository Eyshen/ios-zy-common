//
//  ZYNetworkContextConfig.h
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
//  Created by Eason.zhangyi on 16-12-27.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "AbstractZYBusinessObject.h"
#import "ZYSingleton.h"

/**
 *  网络环境配置
 */
@interface ZYNetworkContextConfig : AbstractZYBusinessObject

/**
 *  检测是否已联网host
 *  default www.baidu.com
 */
@property (nonatomic, copy, readonly) NSString *serverHost;

AS_SINGLETON(ZYNetworkContextConfig)

-(void) setCheckServerHost:(NSString*) host;

@end
