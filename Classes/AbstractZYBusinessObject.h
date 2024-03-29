//
//  BaseBusinessObject.h
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
//  Created by Eason.zhangyi on 16/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYLoggingMacros.h"

/**
 *  业务逻辑基类
 */
@interface AbstractZYBusinessObject : NSObject

/**
 *  销毁对象调用
 */
-(void) deallocObject;

/**
 *  KVO options
 *
 *  @param keyPath 属性名称
 *
 *  @return options
 */
-(NSKeyValueObservingOptions) observerOptionsForKeypath:(NSString*) keyPath;

/**
 *  属性发生变化调用方法（子类继承实现）
 *
 *  @param keyPath 属性名称
 */
-(void)updateUIForKeypath:(NSString*) keyPath;

/**
 *  观察变化属性值列表（子类继承）
 *
 *  @return 属性值列表
 */
-(NSArray*)observableKeypaths;

@end
