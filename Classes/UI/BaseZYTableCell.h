//
//  BaseZYTableCell.h
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
#import "ZYLoggingMacros.h"
/**
 *  自定义UITableCell 基类
 */
@interface BaseZYTableCell : UITableViewCell

/**
 * 加载子视图
 */
-(void) zy_loadSubViews;

/**
 *  计算行高
 *
 *  @param info 计算行高数据
 *
 *  @return 行高
 */
+(CGFloat) zy_getDefaultRowHeight:(id) info;

/**
 *  得到重用标示
 *
 *  @return 标示符
 */
+(NSString*) zy_tableCellIdentifier;

/**
 *  重用cell（当cell被重用时调用）
 */
-(void) zy_reuseTableCell;//重用Cell

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
