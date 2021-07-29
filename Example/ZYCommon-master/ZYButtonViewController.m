//
//  ZYButtonViewController.m
//  ZYCommon-master
//
//  Created by zhangyi on 16/9/27.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYButtonViewController.h"
#import "ZYVerticalButton.h"

@interface ZYButtonViewController ()
@property(nonatomic, weak) IBOutlet ZYVerticalButton *btn;
@end 

@implementation ZYButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_btn setBackgroundColor:[UIColor grayColor]];
    // Do any additional setup after loading the view from its nib.
    [self.btn setSpacing:10];
    [self.btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
