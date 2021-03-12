//
//  BaseZYViewController.h
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

#import <UIKit/UIKit.h>
#import "ZYLoggingMacros.h"
#import "IZYRouterViewController.h"
#import "IZYLoadingView.h"
#import "IZYViewModel.h"
#import "Masonry.h"

/**
 *  视图控制器标题名称
 */
extern NSString * const ZYViewControllerTitleKey;


/**
 *  视图控制器基类
 */
@interface BaseZYViewController : UIViewController<IZYRouterViewController>

#pragma mark IZYRouterViewController
/**
 *  路由委托
 */
@property (nonatomic, weak) id<IZYRouterViewControllerDelegate> routerDelegate;


#pragma mark custom
/**
 *  路由参数
 */
@property (nonatomic, strong) NSDictionary *routerParams;

/**
 *  加载视图
 */
@property (nonatomic, weak, readonly) UIView<IZYLoadingView> *zyLoadingView;

/**
 *  替代self.navigationItem 设置navTitle请修改zyNavTitle属性
 */
@property (nonatomic, weak, readonly) UINavigationItem *zyNavigationItem;

/**
 *  替代 self.navigationController.navigationBar
 */
@property (nonatomic, weak) IBOutlet UINavigationBar *zyNavigationBar;

/**
 *  替代 self.view
 */
@property (nonatomic, weak) IBOutlet UIView *zyView;

/**
 *  zyView 顶部约束(兼容老xib文件中配置为64 如果不设置，则找约束值为64的约束)
 */
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *zyViewTopLayoutConstraint;

/**
 *  导航栏标题
 */
@property (nonatomic, copy) NSString *zyNavTitle;

/**
 *  当前界面是否存在导航栏
 */
-(BOOL) zy_existNavigationBar;

/**
 *  视图控制器初始方法(init初始化完成调用),子类重写后需要[super zy_vcInit]
 */
-(void) zy_vcInit;

/**
 *  加载数据操作方法
 */
-(void) zy_execLoadDataAction;

/**
 *  实例化一个加载视图
 *
 *  @return 加载视图
 */
-(UIView<IZYLoadingView>*) zy_instanceLoadingView;

/**
 *  需要观察的keypath 列表(子类重写实现)
 */
-(NSArray*) zy_observableKeypaths;

/**
 *  指定keypath有修改(子类重写实现)
 */
-(void) zy_changeForKeypath:(NSString*) keypath;

/**
 *  当前视图控制器ViewModel
 */
-(NSArray*) zy_viewModels;

/**
 *  实例化一个视图控制器方法
 */
+(instancetype) zy_instance;


@end
