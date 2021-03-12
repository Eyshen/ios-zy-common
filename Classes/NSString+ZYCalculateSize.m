//
//  NSString+ZYExtension.m
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

#import "NSString+ZYCalculateSize.h"


@implementation NSString (ZYCalculateSize)

-(CGSize)zy_sizeWithFont:(UIFont *)font boundingSize:(CGSize) aSize mode:(NSLineBreakMode)mode {
    return [self zy_sizeWithFont:font boundingSize:aSize mode:mode lineSpacing:0];
}

-(CGSize)zy_sizeWithFont:(UIFont *)font boundingSize:(CGSize) aSize mode:(NSLineBreakMode)mode lineSpacing:(CGFloat) spacing {
    CGSize s = CGSizeZero;
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_7_0
    s = [self sizeWithFont:font constrainedToSize:aSize lineBreakMode:mode];
#else
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    if (spacing > 0) {
        [paragraphStyle setLineSpacing:spacing];
    }
    paragraphStyle.lineBreakMode = mode;
    NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:font,NSFontAttributeName,paragraphStyle,NSParagraphStyleAttributeName, nil];
    s = [self boundingRectWithSize:aSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
#endif
    return s;
}


@end
