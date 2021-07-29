//
//  ZYActiveSheetDemo.m
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

#import "ZYActiveSheetDemo.h"
#import "ZYActionSheetView.h"
#import "TextActionSheetContentView.h"
#import "Masonry.h"

@interface ZYActiveSheetDemo ()

@property (nonatomic, weak) UIView<IZYActionSheetView> *containerView;

@property (nonatomic, weak) TextActionSheetContentView *contentView;

@end

@implementation ZYActiveSheetDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_containerView) {
        ZYActionSheetView *v = [[ZYActionSheetView alloc] initWithContentView:[TextActionSheetContentView zy_instance]];
        [self.view addSubview:v];
        _containerView = v;
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"显示/隐藏" forState:UIControlStateNormal];
        [self.zyView addSubview:button];
        [button addTarget:self action:@selector(btnExec:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(80, 80)]);
            make.centerX.equalTo(self.zyView.mas_centerX);
            make.centerY.equalTo(self.zyView.mas_centerY);
        }];
    }
}

-(void) btnExec:(id)sender {
    NSLog(@"dddddd");
    if ([_containerView isHide]) {
        [_containerView show:YES];
    } else {
        [_containerView hide:YES];
    }
}


-(UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}

@end
