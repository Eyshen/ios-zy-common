//
//  RootViewController.m
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by 张一 on 15/8/21.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic, copy) NSArray *dataSources;
@end

@implementation RootViewController

-(void)zy_vcInit {
    [super zy_vcInit];
    self.dataSources = @[
  @{@"title":@"CollectionView Demo",@"target":@"CollectionViewDemo"},
  @{@"title":@"ZYActiveSheet Demo",@"target":@"ZYActiveSheetDemo"},
  @{@"title":@"ZYAlertView Demo",@"target":@"ZYAlertViewDemo"},
  @{@"title":@"ZYLineView Demo",@"target":@"ZYLineViewController"},
  @{@"title":@"ZYVerticalButton Demo",@"target":@"ZYButtonViewController"}];
    
    
}

#pragma mark UITableViewDelegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSDictionary *d = _dataSources[indexPath.row];
    NSString *target = d[@"target"];
    Class targetClazz = NSClassFromString(target);
    BaseZYViewController *vc = [targetClazz zy_instance];
    [vc setZyNavTitle:d[@"title"]];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark UITableViewDataSource
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSources count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellId = @"kCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId];
    }
    NSDictionary *d = _dataSources[indexPath.row];
    [[cell textLabel] setText:d[@"title"]];
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.zyNavTitle = @"ZYCommon Demos";
    
    [self refreshRunloop];
}
-(void)refreshRunloop{
    
}

-(UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}

-(BOOL)zy_existNavigationBar {
    return YES;
}

@end
