//
//  NSNumber+ZYExtension.h
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

#import <Foundation/Foundation.h>

@interface NSNumber (ZYExtension)

- (void) zy_times:(void(^)(void))block;
- (void) zy_timesWithIndex:(void(^)(NSUInteger index))block;

- (void) zy_upto:(int)number do:(void(^)(NSInteger number))block;
- (void) zy_downto:(int)number do:(void(^)(NSInteger number))block;

// Numeric inflections
- (NSNumber *) zy_seconds;
- (NSNumber *) zy_minutes;
- (NSNumber *) zy_hours;
- (NSNumber *) zy_days;
- (NSNumber *) zy_weeks;
- (NSNumber *) zy_fortnights;
- (NSNumber *) zy_months;
- (NSNumber *) zy_years;

// There are singular aliases for the above methods
- (NSNumber *) zy_second;
- (NSNumber *) zy_minute;
- (NSNumber *) zy_hour;
- (NSNumber *) zy_day;
- (NSNumber *) zy_week;
- (NSNumber *) zy_fortnight;
- (NSNumber *) zy_month;
- (NSNumber *) zy_year;

- (NSDate *) zy_ago;
- (NSDate *) zy_ago:(NSDate *)time;
- (NSDate *) zy_since:(NSDate *)time;
- (NSDate *) zy_until:(NSDate *)time;
- (NSDate *) zy_fromNow;

@end
