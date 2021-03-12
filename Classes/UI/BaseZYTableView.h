//
//  BaseZYTableView.h
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 16/2/18.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IZYPullRefreshView.h"

@interface BaseZYTableView : UITableView

@property (nonatomic, weak) UIView<IZYPullRefreshFooterView> *pullRefreshFooterView;

@property (nonatomic, weak) UIView<IZYPullRefreshView> *pullRefreshHeaderView;

@end
