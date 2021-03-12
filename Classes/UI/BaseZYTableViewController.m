//
//  BaseZYTableViewController.m
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

#import "BaseZYTableViewController.h"
#import "ZYStringUtils.h"
#import "BaseZYTableView.h"

@interface BaseZYTableViewController ()<IZYPullRefreshViewDelegate>

@end

@implementation BaseZYTableViewController

-(UITableViewStyle)zy_tableViewStyle {
    return UITableViewStylePlain;
}

#pragma mark UITableViewDataSource
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark ViewController Overriding
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_tableView) {
        __weak typeof(self) selfObject = self;
        BaseZYTableView *t = [[BaseZYTableView alloc] initWithFrame:self.zyView.bounds style:[self zy_tableViewStyle]];
        [t setBackgroundColor:[UIColor clearColor]];
        [t setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [t setEditing:self.isEditing];
        [t setDelegate:self];
        [t setDataSource:self];
        [self.zyView addSubview:t];
        [t mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(selfObject.zyView);
        }];
        _tableView = t;
    }
    if (self.zyLoadingView && ![self.zyLoadingView isHidden]) {
        [self.zyView bringSubviewToFront:self.zyLoadingView];
    }
}

#pragma mark Overriding superClass
-(void)zy_execLoadDataAction {
    
    [self zy_execRefreshNewDataAction];
}

#pragma mark UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_zyPullRefreshHeaderView) [_zyPullRefreshHeaderView refreshScrollViewDidScroll:scrollView];
    if (_zyPullRefreshFooterView) [_zyPullRefreshFooterView refreshScrollViewDidScroll:scrollView];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (_zyPullRefreshHeaderView) [_zyPullRefreshHeaderView refreshScrollViewDidEndDragging:scrollView];
    if (_zyPullRefreshFooterView) [_zyPullRefreshFooterView refreshScrollViewDidEndDragging:scrollView];
}

#pragma mark IZYPullRefreshViewDelegate
-(BOOL)refreshDidTriggerRefresh:(UIView<IZYPullRefreshView> *)view {
    if (_zyPullRefreshHeaderView == view) {
        [self performSelectorOnMainThread:@selector(zy_execRefreshNewDataAction) withObject:nil waitUntilDone:NO];
        return YES;
    }
    if (_zyPullRefreshFooterView == view) {
        [self performSelectorOnMainThread:@selector(zy_execRefreshMoreDataAction) withObject:nil waitUntilDone:NO];
        return YES;
    }
    return NO;
}

#pragma mark load data exec method
-(void)zy_execRefreshNewDataAction {}

-(void)zy_execRefreshMoreDataAction {}

#pragma mark Instance PullRefreshView
-(UIView<IZYPullRefreshView> *)zy_instancePullRefreshHeaderView {
    return nil;
}

-(UIView<IZYPullRefreshFooterView> *)zy_instancePullRefreshFooterView {
    return nil;
}



#pragma mark enable change
-(void) zy_changeEnabledHeaderRefreshUI {
    if (_enabledHeaderRefresh) {
        ZYLogDebug(@"启用 下拉刷新数据");
        if (!_zyPullRefreshHeaderView) {
            UIView<IZYPullRefreshView> *v = [self zy_instancePullRefreshHeaderView];
            [v setDelegate:self];
            [_tableView addSubview:v];
            _zyPullRefreshHeaderView = v;
            
            [(BaseZYTableView*)_tableView setPullRefreshHeaderView:v];
        }
    } else {
        ZYLogDebug(@"禁用 下拉刷新数据");
        if ([_zyPullRefreshHeaderView superview]) {
            [_zyPullRefreshHeaderView removeFromSuperview];
        }
    }
}

-(void) zy_changeEnabledFooterRefreshUI {
    if (_enabledFooterRefresh) {
        ZYLogDebug(@"启用 加载更多数据");
        if (!_zyPullRefreshFooterView) {
            UIView<IZYPullRefreshFooterView> *v = [self zy_instancePullRefreshFooterView];
            [v setDelegate:self];
            [_tableView addSubview:v];
            _zyPullRefreshFooterView = v;
            
            [(BaseZYTableView*)_tableView setPullRefreshFooterView:v];
        }
    } else {
        ZYLogDebug(@"禁用 加载更多数据");
        if ([_zyPullRefreshFooterView superview]) {
            [_zyPullRefreshFooterView removeFromSuperview];
        }
    }
}

#pragma mark KVO
-(NSArray *)zy_observableKeypaths {
    return @[@"enabledHeaderRefresh",@"enabledFooterRefresh"];
}

-(void)zy_changeForKeypath:(NSString *)keypath {
    if (ZY_STRING_EQUAL(keypath, @"enabledHeaderRefresh")) {
        [self performSelectorOnMainThread:@selector(zy_changeEnabledHeaderRefreshUI) withObject:nil waitUntilDone:NO];
    } else if (ZY_STRING_EQUAL(keypath, @"enabledFooterRefresh")) {
        [self performSelectorOnMainThread:@selector(zy_changeEnabledFooterRefreshUI) withObject:nil waitUntilDone:NO];
    }
}

@end
