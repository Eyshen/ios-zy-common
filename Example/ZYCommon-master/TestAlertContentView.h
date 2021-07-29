//
//  TestAlertContentView.h
//  ZYCommon-master
//
//  Created by zhangyi on 16/6/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "BaseZYView.h"
#import "ZYAlertView.h"

@interface TestAlertContentView : BaseZYView<IZYAlertContentView>

@property(nonatomic, weak) UIView<IZYAlertView> *containerView;

@end
