//
//  TextActionSheetContentView.h
//  ZYCommon-master
//
//  Created by zhangyi on 16/6/15.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "BaseZYView.h"
#import "ZYActionSheetView.h"

@interface TextActionSheetContentView : BaseZYView<IZYActionSheetContentView>

@property(nonatomic, weak) UIView<IZYActionSheetView> *containerView;

@end
