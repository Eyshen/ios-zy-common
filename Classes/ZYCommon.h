//
//  ZYCommon.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/1/12.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYSingleton.h"
#import "AbstractZYBusinessObject.h"
#import "BaseZYEnum.h"
#import "BaseZYObject.h"
#import "NSDate+ZYExtension.h"
#import "NSData+ZYArchive.h"
#import "NSString+ZYCalculateSize.h"
#import "NSString+ZYExtension.h"
#import "NSString+ZYURLEncode.h"
#import "NSSet+ZYExtension.h"
#import "NSNumber+ZYExtension.h"
#import "NSMutableArray+ZYExtension.h"
#import "NSDictionary+ZYExtension.h"
#import "NSArray+ZYExtension.h"
#import "NSNotificationCenter+ZYExtension.h"

#ifdef ZYCommonUtils_h
    #import "ZYCommonUtils.h"
#endif

#ifdef ZYCommonUI_h
    #import "ZYCommonUI.h"
#endif

#ifdef ZYCommonNetworkService_h
#import "ZYCommonNetworkService.h"
#endif


#if __has_feature(objc_arc)
    #define ZY_BLOCK_WEAK               __weak
    #define ZY_WEAK                     weak
    #define ZY_STRONG                   strong
    #define ZY_WEAK_REF_TYPE            __weak typeof(self)
    #define ZY_STRONG_REF_TYPE          __strong typeof(self)
#else
    #define ZY_BLOCK_WEAK               __unsafe_unretained
    #define ZY_WEAK                     assign
    #define ZY_STRONG                   retain
    #define ZY_WEAK_REF_TYPE            __unsafe_unretained typeof(self)
    #define ZY_STRONG_REF_TYPE          typeof(self)
#endif
