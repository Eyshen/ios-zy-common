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
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

/**
 *  计算字符串所占区域大小
 */
@interface NSString (ZYCalculateSize)


/**
 *  计算字符串所占区域大小
 *
 *  @param font             字体
 *  @param boundingSize     边距大小
 *  @param mode             模式
 *
 *  @return 所占区域大小
 */
-(CGSize) zy_sizeWithFont:(UIFont*) font boundingSize:(CGSize) aSize mode:(NSLineBreakMode) mode;

/**
 *  计算字符串所占区域大小
 *
 *  @param font             字体
 *  @param boundingSize     边距大小
 *  @param mode             模式
 *  @param spacing          行间距
 *
 *  @return 所占区域大小
 */
-(CGSize) zy_sizeWithFont:(UIFont*) font boundingSize:(CGSize) aSize mode:(NSLineBreakMode) mode lineSpacing:(CGFloat) spacing;

@end
