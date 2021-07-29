//
//  TestAlertContentView.m
//  ZYCommon-master
//
//  Created by zhangyi on 16/6/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "TestAlertContentView.h"
#import "ZYAlertView.h"

@interface TestAlertContentView ()

-(IBAction)btnExec:(id)sender;

@end

@implementation TestAlertContentView

-(void)btnExec:(id)sender {
    [self.containerView close:NO];
}

#pragma mark IZYAlertContentView
- (CGSize)contentViewSize {
    return CGSizeMake(280.0f, 200.0f);
}

- (CGFloat)backgroundAlpha {
    return 0.6f;
}

-(CGPoint)contentViewOffset {
    return CGPointMake(0, -20);
}

-(CGFloat)keyboardShowContentViewOffsetY {
    return -100.0f;
}

- (ZYAlertViewAnimationType) animationType {
    return ZYAlertViewAnimationTypeNone;
}

@end
