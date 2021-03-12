//
//  BaseZYCollectionCell.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 15/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseZYCollectionCell : UICollectionViewCell

/**
 * 加载子视图
 */
-(void) zy_loadSubViews;

/**
 *  重用cell（当cell被重用时调用）
 */
-(void) zy_reuseCollectionCell;

/**
 *  观察变化属性值列表（子类继承）
 *
 *  @return 属性值列表
 */
-(NSArray*) zy_observableKeypaths;//子类继承

/**
 *  KVO options
 *
 *  @param keyPath 属性名称
 *
 *  @return options
 */
-(NSKeyValueObservingOptions) zy_observerOptionsForKeypath:(NSString*) keyPath;

/**
 *  属性发生变化调用方法（子类继承实现）
 *
 *  @param keyPath 属性名称
 */
-(void) zy_changeForKeypath:(NSString*) keyPath;//子类继承

/**
 *  创建一个实例
 *
 *  @return 实例对象
 */
+(instancetype) zy_instance;

@end
