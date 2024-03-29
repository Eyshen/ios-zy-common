//
//  ZYVerticalButton.m
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "ZYVerticalButton.h"
#import "ZYStringUtils.h"
#import "NSString+ZYCalculateSize.h"

@implementation ZYVerticalButton

-(void)zy_loadSubViews {
    [super zy_loadSubViews];
    [self zy_setFont:self.titleLabel.font];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)refreshUI {
    UIImage *img = [self imageForState:self.state];
    NSString *t = [self titleForState:self.state];
    
    
    CGSize imgSize = CGSizeZero;
    CGSize titleSize = CGSizeZero;
    if (img) imgSize = [img size];
    if (t) titleSize = [t zy_sizeWithFont:self.titleLabel.font boundingSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height) mode:NSLineBreakByWordWrapping];
    
    UIEdgeInsets titleEdge = UIEdgeInsetsMake((imgSize.height+_spacing+titleSize.height)/2.0f + (imgSize.height-titleSize.height)/2, -imgSize.width, 0, 0);
    [self setTitleEdgeInsets:titleEdge];
    UIEdgeInsets imgEdge = UIEdgeInsetsMake(-(imgSize.height+_spacing+titleSize.height)/2.0f + (imgSize.height-titleSize.height)/2, 0, 0, -titleSize.width);
    [self setImageEdgeInsets:imgEdge];
}

-(void)zy_setFont:(UIFont *)font {
    [self.titleLabel setFont:font];
    [self refreshUI];
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    if (self.state == state) {
        [self refreshUI];
    }
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    if (self.state == state) {
        [self refreshUI];
    }
}

-(NSArray *)zy_observableKeypaths {
    return @[@"highlighted",@"spacing",@"selected",@"enabled"];
}

-(void)zy_changeForKeypath:(NSString *)keyPath {
    if (ZY_STRING_EQUAL(keyPath, @"highlighted") || ZY_STRING_EQUAL(keyPath, @"selected") || ZY_STRING_EQUAL(keyPath, @"enabled") || ZY_STRING_EQUAL(keyPath, @"spacing")) {
        [self refreshUI];
    }
}

@end
