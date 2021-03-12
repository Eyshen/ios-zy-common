//
//  BaseZYEnum.m
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
//  Created by Eason.zhangyi on 15/11/25.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "BaseZYEnum.h"

@interface BaseZYEnum ()
@property (nonatomic, copy) NSString *name;//枚举名称
@property (nonatomic, assign) NSInteger value;//枚举值（主要比对值）
@end

@implementation BaseZYEnum

-(instancetype)initWithValue:(NSInteger)value name:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.value = value;
    }
    return self;
}

-(BOOL)isEqual:(id)object {
    BOOL result = NO;
    if (object && [object isMemberOfClass:self.class]) {
        BaseZYEnum *comObject = (BaseZYEnum*) object;
        if (self.value == [comObject value]) {
            result = YES;
        }
    }
    return result;
}

-(NSUInteger)hash {
    return @(_value).hash;
}

#pragma mark IZYEnum
-(NSInteger)value {
    return _value;
}

-(NSString *)name {
    return _name;
}

+(NSSet *)values {
    return [NSSet set];
}

+(id<IZYEnum>)getEnumByValue:(NSInteger)value {
    id<IZYEnum> result = nil;
    NSSet *values = [self values];
    for (id<IZYEnum> o in values) {
        if ([o value] == value) {
            result = o;
            break;
        }
    }
    return result;
}

@end
