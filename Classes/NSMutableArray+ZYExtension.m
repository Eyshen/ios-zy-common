//
//  NSMutableArray+ZYExtension.m
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
//  Created by Eason.zhangyi on 15/12/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "NSMutableArray+ZYExtension.h"
#import "NSArray+ZYExtension.h"

@implementation NSMutableArray (ZYExtension)

- (void) zy_push:(id)object {
    [self addObject:object];
}

- (id) zy_pop {
    id object = [self lastObject];
    [self removeLastObject];
    
    return object;
}

- (NSArray *) zy_pop:(NSUInteger)numberOfElements {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:numberOfElements];
    
    for (NSUInteger i = 0; i < numberOfElements; i++)
        [array insertObject:[self zy_pop] atIndex:0];
    
    return array;
}

- (void) zy_concat:(NSArray *)array {
    [self addObjectsFromArray:array];
}

- (id) zy_shift {
    NSArray *result = [self zy_shift:1];
    return [result zy_first];
}

- (NSArray *) zy_shift:(NSUInteger)numberOfElements {
    NSUInteger shiftLength = MIN(numberOfElements, [self count]);
    
    NSRange range = NSMakeRange(0, shiftLength);
    NSArray *result = [self subarrayWithRange:range];
    [self removeObjectsInRange:range];
    
    return result;
}

- (NSArray *) zy_keepIf:(BOOL (^)(id object))block {
    for (NSUInteger i = 0; i < self.count; i++) {
        id object = self[i];
        if (block(object) == NO) {
            [self removeObject:object];
        }
    }
    
    return self;
}


@end
