//
//  NSString+ZYExtension.h
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

NSString *NSStringWithFormat(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);

@interface NSString (ZYExtension)

/**
 Returns an array containing substrings from the receiver that have been divided by a whitespace delimiter
 
 @return An array containing substrings that have been divided by a whitespace delimiter
 */
- (NSArray *) zy_split;


/**
 Returns an array containing substrings from the receiver that have been divided by a given delimiter
 
 @param delimiter The delimiter string
 @return An array containing substrings that have been divided by delimiter
 */
- (NSArray *) zy_split:(NSString *)delimiter;


/**
 Returns a new string made by converting a snake_case_string to CamelCaseString
 
 @return A string made by converting a snake_case_string to CamelCaseString
 */
- (NSString *) zy_camelCase;


/**
 Returns a Boolean value that indicates whether a given string is a substring of the receiver
 
 @return YES if 'string' is a substring of the receiver, otherwise NO
 */
- (BOOL) zy_containsString:(NSString *)string;


/**
 Returns a new string made by removing whitespaces and newlines from both ends of the receiver
 
 @return A string without trailing or leading whitespaces and newlines
 */
- (NSString *) zy_strip;

@end
