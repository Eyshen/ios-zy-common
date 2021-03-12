//
//  IZYViewModel.h
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

#import <Foundation/Foundation.h>

/**
 *  ViewModel 接口
 */
@protocol IZYViewModel <NSObject>

/**
 *  当前界面是否为活跃界面
 */
@property (nonatomic, assign) BOOL zyActive;

- (void)zy_viewWillAppear;

- (void)zy_viewDidAppear;

- (void)zy_viewWillDisappear;

- (void)zy_viewDidDisappear;

/**
 *  内存警告
 */
- (void)zy_didReceiveMemoryWarning;

@end
