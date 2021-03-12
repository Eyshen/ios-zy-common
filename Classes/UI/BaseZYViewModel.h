//
//  BaseZYViewModel.h
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

#import "AbstractZYBusinessObject.h"
#import "IZYViewModel.h"

@interface BaseZYViewModel : AbstractZYBusinessObject<IZYViewModel>

#pragma mark IZYViewModel
@property (nonatomic, assign) BOOL zyActive;

@end
