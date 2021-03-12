//
//  BaseZYTableViewController.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 15/7/30.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "BaseZYViewController.h"
#import "IZYPullRefreshView.h"

/**
 *  表视图控制器 基类
 */
@interface BaseZYTableViewController : BaseZYViewController<UITableViewDataSource,UITableViewDelegate>

/**
 *  表引用
 */
@property (nonatomic, weak, readonly) UITableView *tableView;

/**
 *  加载更多视图
 */
@property (nonatomic, weak, readonly) UIView<IZYPullRefreshFooterView> *zyPullRefreshFooterView;

/**
 *  下拉刷新视图
 */
@property (nonatomic, weak, readonly) UIView<IZYPullRefreshView> *zyPullRefreshHeaderView;

/**
 *  是否启用下拉刷新
 */
@property (nonatomic, assign) BOOL enabledHeaderRefresh;

/**
 *  是否启用加载更多
 */
@property (nonatomic, assign) BOOL enabledFooterRefresh;

/**
 *  tableView 样式
 */
-(UITableViewStyle) zy_tableViewStyle;

/**
 *  加载新数据操作方法
 */
-(void) zy_execRefreshNewDataAction;

/**
 *  加载更多数据操作方法
 */
-(void) zy_execRefreshMoreDataAction;

/**
 *  实例化一个下拉刷新数据视图
 */
-(UIView<IZYPullRefreshView> *) zy_instancePullRefreshHeaderView;

/**
 *  实例化一个上拉刷新数据视图
 */
-(UIView<IZYPullRefreshFooterView> *) zy_instancePullRefreshFooterView;

@end
