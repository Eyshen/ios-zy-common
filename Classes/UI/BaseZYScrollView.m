//
//  BaseZYScrollView.m
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/2/18.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "BaseZYScrollView.h"

@interface BaseZYScrollView ()
@property (nonatomic, assign) BOOL initTag;
@end

@implementation BaseZYScrollView

-(instancetype)init {
    self = [super init];
    if (self) {
        [self zyTableInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self zyTableInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self zyTableInit];
    }
    return self;
}


-(void) zyTableInit {
    if (!_initTag) {
        //去除子视图响应延时问题
        self.canCancelContentTouches = YES;
        UIView *wrapView = self.subviews.firstObject;
        if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
            for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
                if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                    gesture.enabled = NO;
                    break;
                }
            }
        }
        self.delaysContentTouches = NO;
        _initTag = YES;
    }
}

@end
