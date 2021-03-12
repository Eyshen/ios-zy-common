//
//  NSNumber+ZYExtension.m
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

#import "NSNumber+ZYExtension.h"

@implementation NSNumber (ZYExtension)

- (void) zy_times:(void (^)(void))block {
    for (int i = 0; i < self.integerValue; i++)
        block();
}

- (void) zy_timesWithIndex:(void (^)(NSUInteger))block {
    for (int i = 0; i < self.unsignedIntegerValue; i++)
        block(i);
}

- (void) zy_upto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i <= number; i++)
        block(i);
}

- (void) zy_downto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i >= number; i--)
        block(i);
}

- (NSNumber *) zy_second {
    return self.zy_seconds;
}

- (NSNumber *) zy_seconds {
    return self;
}

- (NSNumber *) zy_minute {
    return self.zy_minutes;
}

- (NSNumber *) zy_minutes {
    return @(self.floatValue * 60);
}

- (NSNumber *)zy_hour {
    return self.zy_hours;
}

- (NSNumber *)zy_hours {
    return @(self.floatValue * [@60 zy_minutes].integerValue);
}

- (NSNumber *)zy_day {
    return self.zy_days;
}

- (NSNumber *)zy_days {
    return @(self.floatValue * [@24 zy_hours].integerValue);
}

- (NSNumber *)zy_week {
    return self.zy_weeks;
}

- (NSNumber *)zy_weeks {
    return @(self.floatValue * [@7 zy_days].integerValue);
}

- (NSNumber *)zy_fortnight {
    return self.zy_fortnights;
}

- (NSNumber *)zy_fortnights {
    return @(self.floatValue * [@2 zy_weeks].integerValue);
}

- (NSNumber *)zy_month {
    return self.zy_months;
}

- (NSNumber *)zy_months {
    return @(self.floatValue * [@30 zy_days].integerValue);
}

- (NSNumber *)zy_year {
    return self.zy_years;
}

- (NSNumber *)zy_years {
    return @(self.floatValue * [@(365.25) zy_days].integerValue);
}

- (NSDate *)zy_ago {
    return [self zy_ago:[NSDate date]];
}

- (NSDate *)zy_ago:(NSDate *)time {
    return [NSDate dateWithTimeIntervalSince1970:([time timeIntervalSince1970] - self.floatValue)];
}

- (NSDate *)zy_since:(NSDate *)time {
    return [NSDate dateWithTimeIntervalSince1970:([time timeIntervalSince1970] + self.floatValue)];
}

- (NSDate *)zy_until:(NSDate *)time {
    return [self zy_ago:time];
}

- (NSDate *)zy_fromNow {
    return [self zy_since:[NSDate date]];
}

@end
