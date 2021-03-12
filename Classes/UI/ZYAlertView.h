//
//  ZYAlertView.h
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

#import "BaseZYView.h"

typedef NS_ENUM(NSInteger, ZYAlertViewAnimationType) {
    ZYAlertViewAnimationTypeNone,//无
    ZYAlertViewAnimationTypeTop,//顶部朝下显示
    ZYAlertViewAnimationTypeBottom,//底部朝上显示
    ZYAlertViewAnimationTypeZoom,//放大缩小
};

@protocol IZYAlertView;

/**
 *  提示框内容视图
 */
@protocol IZYAlertContentView <NSObject>

/**
 *  内容视图大小
 */
- (CGSize)contentViewSize;

/**
 *  容器视图
 */
@property(nonatomic, weak) UIView<IZYAlertView> *containerView;



@optional
/**
 *  透明度
 *
 *  @return 0.0~1.0
 *
 *  default 0.3f
 */
- (CGFloat)backgroundAlpha;

/**
 *  动画时长
 *
 *  default 0.25f
 */
- (NSTimeInterval) animatedDuration;

/**
 *  偏移量，相对于中点
 */
- (CGPoint) contentViewOffset;

/**
 * 键盘显示时偏移量
 */
- (CGFloat) keyboardShowContentViewOffsetY;

@end





/**
 *  提示框接口
 */
@protocol IZYAlertView <NSObject>

/**
 *  初始化提示框
 */
- (instancetype)initWithContentView:(UIView<IZYAlertContentView>*)contentView;



/**
 *  初始化提示框
 */
- (instancetype)initWithContentView:(UIView<IZYAlertContentView>*)contentView nokeyboardNotification:(BOOL)noNotification;


/**
 *  关闭提示框
 */
- (void)close:(BOOL)animated;

/**
 *  显示提示框  默认在window上显示
 */
- (void)show:(BOOL)animated;

/**
 *  在指定视图上显示提示框
 *
 *  @param view     视图
 *  @param animated 是否动画
 */
- (void)showInView:(UIView*)view animated:(BOOL)animated;

/**
 *  当前App是否已显示了次类型提示框
 */
+(BOOL) existAlertView;

/**
 *  关闭所有提示框
 */
+(void) closeAllAlertView;

@end

/**
 *  提示框(提示框关闭后会直接从父类上移除)
 */
@interface ZYAlertView : BaseZYView<IZYAlertView>


@end
