//
//  ZYAlertViewDemo.m
//  ZYCommon-master
//
//  Created by 张一 on 16/6/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYAlertViewDemo.h"
#import "ZYAlertView.h"
#import "Masonry.h"
#import "TestAlertContentView.h"

@interface ZYAlertViewDemo ()

//@property(nonatomic, weak) ZYAlertView *alertView;

@property(nonatomic, weak) TestAlertContentView *contentView;

@end

@implementation ZYAlertViewDemo


-(void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"显示/隐藏" forState:UIControlStateNormal];
    [self.zyView addSubview:button];
    [button addTarget:self action:@selector(btnExec:) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(80, 80)]);
        make.centerX.equalTo(self.zyView.mas_centerX);
        make.centerY.equalTo(self.zyView.mas_centerY);
    }];
    
    self.zyNavigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"CloseAll" style:UIBarButtonItemStylePlain target:self action:@selector(rightExec:)];
}

-(void) rightExec:(id)sender {
    [ZYAlertView closeAllAlertView];
}

-(void) btnExec:(id)sender {
    ZYAlertView *alertView = [[ZYAlertView alloc] initWithContentView:[TestAlertContentView zy_instance]];
    [alertView showInView:self.view animated:YES];
}


-(UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}

@end
