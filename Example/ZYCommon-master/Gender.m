//
//  Gender.m
//
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//  Created by Eason.zhangyi on 15/11/25.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "Gender.h"

@interface Gender ()

@end

static NSSet *genders;

@implementation Gender

+(void)load {
    genders = [[NSSet alloc] initWithObjects:
               ENUMINIT(0, @"男"),
               ENUMINIT(1, @"女"),
               nil];
}

+(NSSet *)values {
    return genders;
}

+(instancetype)man {
    return (Gender*)[self getEnumByValue:0];
}

+(instancetype)women {
    return (Gender*)[self getEnumByValue:1];
}

@end
