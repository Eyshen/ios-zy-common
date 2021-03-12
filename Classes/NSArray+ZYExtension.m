//
//  NSArray+ZYExtension.m
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

#import "NSArray+ZYExtension.h"
#import "NSMutableArray+ZYExtension.h"
#import "NSString+ZYExtension.h"

@implementation NSArray (ZYExtension)

- (id) zy_first {
    return [self firstObject];
}

- (id) zy_last {
    return [self lastObject];
}

- (id) zy_sample {
    if (self.count == 0) return nil;
    
    NSUInteger index = arc4random_uniform((u_int32_t)self.count);
    return self[index];
}

- (id) zy_objectForKeyedSubscript:(id <NSCopying>)key {
    NSRange range;
    if ([(id)key isKindOfClass:[NSString class]]) {
        NSString *keyString = (NSString *)key;
        range = NSRangeFromString(keyString);
        if ([keyString containsString:@"..."]) {
            range = NSMakeRange(range.location, range.length - range.location);
        } else if ([keyString containsString:@".."]) {
            range = NSMakeRange(range.location, range.length - range.location + 1);
        }
    } else if ([(id)key isKindOfClass:[NSValue class]]) {
        range = [((NSValue *)key) rangeValue];
    } else {
        [NSException raise:NSInvalidArgumentException format:@"expected NSString or NSValue argument, got %@ instead", [(id)key class]];
    }
    
    return [self subarrayWithRange:range];
}


- (void) zy_each:(void (^)(id object))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void) zy_eachWithIndex:(void (^)(id object, NSUInteger  index))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (BOOL) zy_includes:(id)object {
    return [self containsObject:object];
}

- (NSArray *) zy_take:(NSUInteger)numberOfElements {
    numberOfElements = MIN(numberOfElements, [self count]);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:numberOfElements];
    
    for (NSUInteger i = 0; i < numberOfElements; i++) {
        [array addObject:self[i]];
    }
    
    return array;
}

- (NSArray *) zy_takeWhile:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray array];
    
    for (id arrayObject in self) {
        if (block(arrayObject))
            [array addObject:arrayObject];
        
        else break;
    }
    
    return array;
}

- (NSArray *) zy_map:(id (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self) {
        id newObject = block(object);
        if (newObject) {
            [array addObject:newObject];
        }
    }
    
    return array;
}

- (NSArray *) zy_select:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self) {
        if (block(object)) {
            [array addObject:object];
        }
    }
    
    return array;
}

- (id) zy_detect:(BOOL (^)(id object))block {
    
    for (id object in self) {
        if (block(object))
            return object;
    }
    
    return nil;
}

- (id) zy_find:(BOOL (^)(id object))block {
    return [self zy_detect:block];
}

- (NSArray *) zy_reject:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self) {
        if (block(object) == NO) {
            [array addObject:object];
        }
    }
    
    return array;
}

- (NSArray *) zy_flatten {
    NSMutableArray *array = [NSMutableArray array];
    
    for (id object in self) {
        if ([object isKindOfClass:NSArray.class]) {
            [array zy_concat:[object zy_flatten]];
        } else {
            [array addObject:object];
        }
    }
    
    return array;
}

- (NSString *) zy_join {
    return [self componentsJoinedByString:@""];
}

- (NSString *) zy_join:(NSString *)separator {
    return [self componentsJoinedByString:separator];
}

- (NSArray *) zy_sort {
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *) zy_sortBy:(NSString*)key; {
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
    return [self sortedArrayUsingDescriptors:@[descriptor]];
}

- (NSArray *) zy_reverse {
    return self.reverseObjectEnumerator.allObjects;
}

#pragma mark - Set operations

- (NSArray *) zy_intersectionWithArray:(NSArray *)array {
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"SELF IN %@", array];
    return [self filteredArrayUsingPredicate:intersectPredicate];
}

- (NSArray *) zy_unionWithArray:(NSArray *)array {
    NSArray *complement = [self zy_relativeComplement:array];
    return [complement arrayByAddingObjectsFromArray:array];
}

- (NSArray *) zy_relativeComplement:(NSArray *)array {
    NSPredicate *relativeComplementPredicate = [NSPredicate predicateWithFormat:@"NOT SELF IN %@", array];
    return [self filteredArrayUsingPredicate:relativeComplementPredicate];
}

- (NSArray *) zy_symmetricDifference:(NSArray *)array {
    NSArray *aSubtractB = [self zy_relativeComplement:array];
    NSArray *bSubtractA = [array zy_relativeComplement:self];
    return [aSubtractB zy_unionWithArray:bSubtractA];
}

@end
