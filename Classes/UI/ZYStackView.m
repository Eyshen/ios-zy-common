//
//  ZYStackView.m
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

#import "ZYStackView.h"

@interface ZYStackView ()

@end

@implementation ZYStackView

- (NSArray*)arrangedSubviews {
    return [self subviews];
}

- (void)removeArrangedSubview:(UIView*) view {
    if ([[self subviews] containsObject:view]) {
        [view removeFromSuperview];
        [self setNeedsLayout];
    }
}

- (void)addArrangedSubview:(UIView *)view {
    if (![[self subviews] containsObject:view]) {
        [self addSubview:view];
        [self setNeedsLayout];
    }
}

-(void)zy_loadSubViews {
    [super zy_loadSubViews];
    [self setBackgroundColor:[UIColor clearColor]];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    NSArray *a = [self subviews];
    if (_axis == zyStackViewAxisHorizontal) {
        CGFloat w = self.bounds.size.width / [a count];
        for (int i=0; i<[a count]; i++) {
            UIView *v = a[i];
            [v setFrame:CGRectMake(i*w, 0, w, self.bounds.size.height)];
        }
    } else {
        CGFloat h = self.bounds.size.height / [a count];
        for (int i=0; i<[a count]; i++) {
            UIView *v = a[i];
            [v setFrame:CGRectMake(0, i*h, self.bounds.size.width, h)];
        }
    }
}

-(NSArray *)zy_observableKeypaths {
    return @[@"axis"];
}

-(void)zy_changeForKeypath:(NSString *)keyPath {
    [self setNeedsLayout];
}

@end
