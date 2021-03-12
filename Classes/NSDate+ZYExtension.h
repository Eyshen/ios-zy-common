//
//  NSDate+ZYExtension.h
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

@interface NSDate (ZYExtension)

@property (readonly, nonatomic) NSInteger zy_year;//年
@property (readonly, nonatomic) NSInteger zy_month;//月
@property (readonly, nonatomic) NSInteger zy_day;//天
@property (readonly, nonatomic) NSInteger zy_weekday;//星期
@property (readonly, nonatomic) NSInteger zy_weekOfYear;//一年的第几周
@property (readonly, nonatomic) NSInteger zy_hour;//时
@property (readonly, nonatomic) NSInteger zy_minute;//分
@property (readonly, nonatomic) NSInteger zy_second;//秒

@property (readonly, nonatomic) NSDate *zy_dateByIgnoringTimeComponents;
@property (readonly, nonatomic) NSDate *zy_firstDayOfMonth;
@property (readonly, nonatomic) NSDate *zy_lastDayOfMonth;
@property (readonly, nonatomic) NSDate *zy_firstDayOfWeek;
@property (readonly, nonatomic) NSDate *zy_middleOfWeek;
@property (readonly, nonatomic) NSDate *zy_tomorrow;
@property (readonly, nonatomic) NSDate *zy_yesterday;
@property (readonly, nonatomic) NSInteger zy_numberOfDaysInMonth;

+ (instancetype)zy_dateFromString:(NSString *)string format:(NSString *)format;
+ (instancetype)zy_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (NSDate *)zy_dateByAddingYears:(NSInteger)years;
- (NSDate *)zy_dateBySubtractingYears:(NSInteger)years;
- (NSDate *)zy_dateByAddingMonths:(NSInteger)months;
- (NSDate *)zy_dateBySubtractingMonths:(NSInteger)months;
- (NSDate *)zy_dateByAddingWeeks:(NSInteger)weeks;
- (NSDate *)zy_dateBySubtractingWeeks:(NSInteger)weeks;
- (NSDate *)zy_dateByAddingDays:(NSInteger)days;
- (NSDate *)zy_dateBySubtractingDays:(NSInteger)days;
- (NSInteger)zy_yearsFrom:(NSDate *)date;
- (NSInteger)zy_monthsFrom:(NSDate *)date;
- (NSInteger)zy_weeksFrom:(NSDate *)date;
- (NSInteger)zy_daysFrom:(NSDate *)date;

- (BOOL)zy_isEqualToDateForMonth:(NSDate *)date;
- (BOOL)zy_isEqualToDateForWeek:(NSDate *)date;
- (BOOL)zy_isEqualToDateForDay:(NSDate *)date;

- (NSString *)zy_stringWithFormat:(NSString *)format;
- (NSString *)zy_string;

@end



@interface NSCalendar (ZYExtension)

+ (instancetype)zy_sharedCalendar;

@end

@interface NSDateFormatter (ZYExtension)

+ (instancetype)zy_sharedDateFormatter;

@end

@interface NSDateComponents (ZYExtension)

+ (instancetype)zy_sharedDateComponents;

@end
