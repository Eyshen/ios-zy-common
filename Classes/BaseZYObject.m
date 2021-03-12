//
//  BaseZYObject.m
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
//  Created by Eason.zhangyi on 15/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "BaseZYObject.h"
#import "ZYJSONUtils.h"
#import "ZYLoggerFactory.h"

@implementation BaseZYObject

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    id copyObject = [[[self class] allocWithZone:zone] init];
    NSArray *allPropertys = [[ZYJSONUtils getJsonObjectDesc:self.class] allPropertys];
    for (ZYJSONPropertyDesc *desc in allPropertys) {
        @try {
            id value = [self valueForKey:desc.name];
            if (value != nil && (NSNull*)value != [NSNull null]) {
                if ([value isKindOfClass:[NSNumber class]]) {
                    [copyObject setValue:value forKey:desc.name];
                } else if ([value isKindOfClass:[NSMutableArray class]] || [value isKindOfClass:[NSMutableSet class]] || [value isKindOfClass:[NSMutableDictionary class]]) {
                    [copyObject setValue:[value mutableCopyWithZone:zone] forKey:desc.name];
                }else {
                    [copyObject setValue:[value copyWithZone:zone] forKey:desc.name];
                }
            }
        }
        @catch (NSException *exception) {
            ZYLogError(@"copyWithZone:exception:%@",exception);
        }
    }
    return copyObject;
}
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSArray *allPropertys = [[ZYJSONUtils getJsonObjectDesc:self.class] allPropertys];
    for (ZYJSONPropertyDesc *desc in allPropertys) {
        @try {
            [aCoder encodeObject:[self valueForKey:desc.name] forKey:desc.name];
        }
        @catch (NSException *exception) {
            ZYLogError(@"encodeWithCoder:exception:%@",exception);
        }
    }
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        NSArray *allPropertys = [[ZYJSONUtils getJsonObjectDesc:self.class] allPropertys];
        for (ZYJSONPropertyDesc *desc in allPropertys) {
            id value = [aDecoder decodeObjectForKey:desc.name];
            if (value != nil && (NSNull*)value != [NSNull null]) {
                @try {
                    [self setValue:value forKey:desc.name];
                }
                @catch (NSException *exception) {
                    ZYLogError(@"initWithCoder:exception:%@",exception);
                }
                
            }
        }
    }
    return self;
}
#pragma override NSObject
-(NSString *)description {
    NSMutableString *string = [[NSMutableString alloc] init];
    NSArray *allPropertys = [[ZYJSONUtils getJsonObjectDesc:self.class] allPropertys];
    [string appendString:@"("];
    for (ZYJSONPropertyDesc *desc in allPropertys) {
        @try {
            [string appendFormat:@"%@:%@,",desc.name,[self valueForKey:desc.name]];
        }
        @catch (NSException *exception) {
            [string appendFormat:@"%@:%@,",desc.name,@"null"];
        }
    }
    [string appendString:@")"];
    return [NSString stringWithFormat:@"%@:%@",NSStringFromClass([self class]),string];
}
@end
