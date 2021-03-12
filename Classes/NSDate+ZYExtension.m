//
//  NSDate+ZYExtension.m
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

#import "NSDate+ZYExtension.h"

@implementation NSDate (ZYExtension)
- (NSInteger)zy_year
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitYear fromDate:self];
    return component.year;
}

- (NSInteger)zy_month
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitMonth
                                              fromDate:self];
    return component.month;
}

- (NSInteger)zy_day
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitDay
                                              fromDate:self];
    return component.day;
}

- (NSInteger)zy_weekday
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekday fromDate:self];
    return component.weekday;
}

- (NSInteger)zy_weekOfYear
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitWeekOfYear fromDate:self];
    return component.weekOfYear;
}

- (NSInteger)zy_hour
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitHour
                                              fromDate:self];
    return component.hour;
}

- (NSInteger)zy_minute
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitMinute
                                              fromDate:self];
    return component.minute;
}

- (NSInteger)zy_second
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitSecond
                                              fromDate:self];
    return component.second;
}

- (NSDate *)zy_dateByIgnoringTimeComponents
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    return [calendar dateFromComponents:components];
}

- (NSDate *)zy_firstDayOfMonth
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth| NSCalendarUnitDay fromDate:self];
    components.day = 1;
    return [calendar dateFromComponents:components];
}

- (NSDate *)zy_lastDayOfMonth
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    components.month++;
    components.day = 0;
    return [calendar dateFromComponents:components];
}

- (NSDate *)zy_firstDayOfWeek
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToSubtract = [NSDateComponents zy_sharedDateComponents];
    componentsToSubtract.day = - (weekdayComponents.weekday - calendar.firstWeekday);
    NSDate *beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:beginningOfWeek];
    beginningOfWeek = [calendar dateFromComponents:components];
    componentsToSubtract.day = NSIntegerMax;
    return beginningOfWeek;
}

- (NSDate *)zy_middleOfWeek
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToSubtract = [NSDateComponents zy_sharedDateComponents];
    componentsToSubtract.day = - (weekdayComponents.weekday - calendar.firstWeekday) + 3;
    NSDate *middleOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:middleOfWeek];
    middleOfWeek = [calendar dateFromComponents:components];
    componentsToSubtract.day = NSIntegerMax;
    return middleOfWeek;
}

- (NSDate *)zy_tomorrow
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    components.day++;
    return [calendar dateFromComponents:components];
}

- (NSDate *)zy_yesterday
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    components.day--;
    return [calendar dateFromComponents:components];
}

- (NSInteger)zy_numberOfDaysInMonth
{
    NSCalendar *c = [NSCalendar zy_sharedCalendar];
    NSRange days = [c rangeOfUnit:NSCalendarUnitDay
                           inUnit:NSCalendarUnitMonth
                          forDate:self];
    return days.length;
}

+ (instancetype)zy_dateFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter zy_sharedDateFormatter];
    formatter.dateFormat = format;
    return [formatter dateFromString:string];
}

+ (instancetype)zy_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [NSDateComponents zy_sharedDateComponents];
    components.year = year;
    components.month = month;
    components.day = day;
    NSDate *date = [calendar dateFromComponents:components];
    components.year = NSIntegerMax;
    components.month = NSIntegerMax;
    components.day = NSIntegerMax;
    return date;
}

- (NSDate *)zy_dateByAddingYears:(NSInteger)years
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [NSDateComponents zy_sharedDateComponents];
    components.year = years;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.year = NSIntegerMax;
    return date;
}

- (NSDate *)zy_dateBySubtractingYears:(NSInteger)years
{
    return [self zy_dateByAddingYears:-years];
}

- (NSDate *)zy_dateByAddingMonths:(NSInteger)months
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [NSDateComponents zy_sharedDateComponents];
    components.month = months;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.month = NSIntegerMax;
    return date;
}

- (NSDate *)zy_dateBySubtractingMonths:(NSInteger)months
{
    return [self zy_dateByAddingMonths:-months];
}

- (NSDate *)zy_dateByAddingWeeks:(NSInteger)weeks
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [NSDateComponents zy_sharedDateComponents];
    components.weekOfYear = weeks;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.weekOfYear = NSIntegerMax;
    return date;
}

-(NSDate *)zy_dateBySubtractingWeeks:(NSInteger)weeks
{
    return [self zy_dateByAddingWeeks:-weeks];
}

- (NSDate *)zy_dateByAddingDays:(NSInteger)days
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [NSDateComponents zy_sharedDateComponents];
    components.day = days;
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    components.day = NSIntegerMax;
    return date;
}

- (NSDate *)zy_dateBySubtractingDays:(NSInteger)days
{
    return [self zy_dateByAddingDays:-days];
}

- (NSInteger)zy_yearsFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.year;
}

- (NSInteger)zy_monthsFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.month;
}

- (NSInteger)zy_weeksFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekOfYear
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.weekOfYear;
}

- (NSInteger)zy_daysFrom:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar zy_sharedCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay
                                               fromDate:date
                                                 toDate:self
                                                options:0];
    return components.day;
}

- (NSString *)zy_stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter zy_sharedDateFormatter];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *)zy_string
{
    return [self zy_stringWithFormat:@"yyyyMMdd"];
}


- (BOOL)zy_isEqualToDateForMonth:(NSDate *)date
{
    return self.zy_year == date.zy_year && self.zy_month == date.zy_month;
}

- (BOOL)zy_isEqualToDateForWeek:(NSDate *)date
{
    return self.zy_year == date.zy_year && self.zy_weekOfYear == date.zy_weekOfYear;
}

- (BOOL)zy_isEqualToDateForDay:(NSDate *)date
{
    return self.zy_year == date.zy_year && self.zy_month == date.zy_month && self.zy_day == date.zy_day;
}
@end


@implementation NSCalendar (ZYExtension)

+ (instancetype)zy_sharedCalendar
{
    static id instance;
    static dispatch_once_t zy_sharedCalendar_onceToken;
    dispatch_once(&zy_sharedCalendar_onceToken, ^{
        instance = [NSCalendar currentCalendar];
    });
    return instance;
}

@end


@implementation NSDateFormatter (ZYExtension)

+ (instancetype)zy_sharedDateFormatter
{
    static id instance;
    static dispatch_once_t zy_sharedDateFormatter_onceToken;
    dispatch_once(&zy_sharedDateFormatter_onceToken, ^{
        instance = [[NSDateFormatter alloc] init];
    });
    return instance;
}

@end

@implementation NSDateComponents (ZYExtension)

+ (instancetype)zy_sharedDateComponents
{
    static id instance;
    static dispatch_once_t zy_sharedDateFormatter_onceToken;
    dispatch_once(&zy_sharedDateFormatter_onceToken, ^{
        instance = [[NSDateComponents alloc] init];
    });
    return instance;
}

@end
