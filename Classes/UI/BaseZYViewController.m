//
//  BaseZYViewController.m
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
#import "BaseZYNavigationBar.h"

NSString * const ZYViewControllerTitleKey = @"ZYViewControllerTitleKey";


@interface BaseZYViewController ()<IZYLoadingViewDelegate>
@property (nonatomic, assign) BOOL zyInitTag;
@end

@implementation BaseZYViewController

-(BOOL)zy_existNavigationBar {
    return YES;
}

#pragma mark custom
-(NSArray*)zy_viewModels {
    return nil;
}

#pragma mark IZYLoadingViewDelegate
-(void)loadingRefresh:(UIView<IZYLoadingView> *)loadingView {
    [loadingView setState:ZYLoadingStateLoading];
    [self performSelectorOnMainThread:@selector(zy_execLoadDataAction) withObject:nil waitUntilDone:NO];
}
#pragma mark ViewController Overriding
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSArray *viewModels = [self zy_viewModels];
    for (id<IZYViewModel> vm in viewModels) {
        [vm setZyActive:NO];
        [vm zy_viewWillDisappear];
    }
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSArray *viewModels = [self zy_viewModels];
    for (id<IZYViewModel> vm in viewModels) {
        [vm zy_viewDidDisappear];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationController) {
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
    } else {
        [self setNeedsStatusBarAppearanceUpdate];
    }
    NSArray *viewModels = [self zy_viewModels];
    for (id<IZYViewModel> vm in viewModels) {
        [vm setZyActive:YES];
        [vm zy_viewWillAppear];
    }
    if (_zyLoadingView) [self.view bringSubviewToFront:_zyLoadingView];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSArray *viewModels = [self zy_viewModels];
    for (id<IZYViewModel> vm in viewModels) {
        [vm zy_viewDidAppear];
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];

    if (@available(iOS 11.0, *)) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
#endif
    } else {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        //解决iOS7之后滚动视图留有间隙问题
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
#endif
    }
    
    [self zy_refreshUIElement];
    
    //添加加载视图
    if (!_zyLoadingView) {
        UIView<IZYLoadingView> *v = [self zy_instanceLoadingView];
        if (v) {
            [v setDelegate:self];
            [v setOffsetY:-20.0f];
            [self.zyView addSubview:v];
            __weak typeof(self) selfObject = self;
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(selfObject.zyView);
            }];
            _zyLoadingView = v;
        }
    }
    
    [self loadingRefresh:_zyLoadingView];
}

#pragma mark NavigationBar style
-(void)setZYNavTitle:(NSString *)zyNavTitle {
    if (_zyNavTitle == zyNavTitle) {
        return;
    }
    _zyNavTitle = [zyNavTitle copy];
    [_zyNavigationItem setTitle:_zyNavTitle];
}


-(void) zy_popExec:(id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}

-(void) zy_refreshUIElement {
    CGFloat statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    if ([self zy_existNavigationBar]) {
        __weak typeof(self) selfObject = self;
        if (!_zyNavigationBar) {
            BaseZYNavigationBar *bar = [[BaseZYNavigationBar alloc] init];
            UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:self.zyNavTitle];
            _zyNavigationItem = item;
            
            [bar setItems:[NSArray arrayWithObjects:item, nil]];
            
            if ([self.navigationController.viewControllers count] > 1) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
                UIImage *icon = [UIImage imageNamed:@"zy-nav-icon-back"];
                UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:icon style:UIBarButtonItemStylePlain target:self action:@selector(zy_popExec:)];
                [self.zyNavigationItem setLeftBarButtonItem:backItem];
#else
                UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL];
                negativeSpacer.width = -2.0f;
                UIImage *icon = [UIImage imageNamed:@"zy-nav-icon-back"];
                UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:icon style:UIBarButtonItemStylePlain target:self action:@selector(zy_popExec:)];
                [self.zyNavigationItem setLeftBarButtonItems:@[negativeSpacer,backItem]];
#endif
            }
            [self.view addSubview:bar];
            [bar mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(selfObject.view.mas_left);
                make.right.equalTo(selfObject.view.mas_right);
                make.top.equalTo(selfObject.view.mas_top);
                make.height.equalTo(@(statusHeight+44.0f));
            }];
            _zyNavigationBar = bar;
        }
        if (!_zyView) {
//            UIView *v = [[UIView alloc] initWithFrame:([self edgesForExtendedLayout] & UIRectEdgeTop) ? self.view.bounds : CGRectMake(0, 64.0f, self.view.bounds.size.width, self.view.bounds.size.height - 64.0f)];
            UIView *v = [[UIView alloc] init];
            [self.view insertSubview:v atIndex:0];
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                UIEdgeInsets edgeInsets = UIEdgeInsetsMake(([selfObject edgesForExtendedLayout] & UIRectEdgeTop) ? 0 : statusHeight+44.0f, 0, 0, 0);
                make.edges.equalTo(selfObject.view).with.insets(edgeInsets);
            }];
            _zyView = v;
        } else {
            if (self.zyViewTopLayoutConstraint) {
                [self.zyViewTopLayoutConstraint setConstant:statusHeight+44.0f];
            } else {
                NSArray *constraints = [self.view constraints];
                for (NSLayoutConstraint *constraint in constraints) {
                    if ([constraint constant] == 64.0f) {
                        [constraint setConstant:statusHeight+44.0f];
                        break;
                    }
                }
            }
        }
    } else {
        _zyView = self.view;
    }
}


-(BOOL)shouldAutorotate {
    return NO;
}

//-(void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    if ([self zy_existNavigationBar]) {
//        [_zyNavigationBar setFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64.0f)];
//        if ([self edgesForExtendedLayout] & UIRectEdgeTop) {
//            [_zyView setFrame:self.view.bounds];
//        } else {
//            [_zyView setFrame:CGRectMake(0, 64.0f, self.view.bounds.size.width, self.view.bounds.size.height - 64.0f)];
//        }
//    }
//}

-(void)dealloc {
    [self zy_unregisterFromKVO];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0f) {
        if (self.isViewLoaded && !self.view.window) {
            self.view = nil;
        }
    }
#endif
    
    NSArray *viewModels = [self zy_viewModels];
    for (id<IZYViewModel> vm in viewModels) {
        [vm zy_didReceiveMemoryWarning];
    }
    
}

-(instancetype)init {
    self = [super init];
    if (self) {
        if (!_zyInitTag) {
            [self zy_vcInit];
            _zyInitTag = YES;
        }
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        if (!_zyInitTag) {
            [self zy_vcInit];
            _zyInitTag = YES;
        }
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if (!_zyInitTag) {
            [self zy_vcInit];
            _zyInitTag = YES;
        }
    }
    return self;
}

-(void)zy_vcInit {
    [self zy_registerForKVO];
}


#pragma mark exec action method
-(void) zy_execLoadDataAction {}

#pragma mark instance
+(instancetype) zy_instance {
    BaseZYViewController *viewController = nil;
    @try {
        NSString *className = NSStringFromClass(self);
        NSString *nibFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.nib",className]];
        NSString *iphoneNibFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@~iphone.nib",className]];
        NSString *ipadNibFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@~ipad.nib",className]];
        NSFileManager *fm = [NSFileManager defaultManager];
        if ([fm fileExistsAtPath:iphoneNibFilePath] || [fm fileExistsAtPath:nibFilePath] || [fm fileExistsAtPath:ipadNibFilePath]) {
            viewController = [[self alloc] initWithNibName:className bundle:[NSBundle mainBundle]];
        } else {
            viewController = [[self alloc] init];
        }
    }
    @catch (NSException *exception) {
        viewController = [[self alloc] init];
    }
    return viewController;
}

#pragma mark Instance LoadingView
-(UIView<IZYLoadingView> *)zy_instanceLoadingView {
    return nil;
}


#pragma mark KVO
-(NSKeyValueObservingOptions) observerOptionsForKeypath:(NSString*) keyPath {
    return NSKeyValueObservingOptionNew;
}
-(void) zy_registerForKVO {
    NSArray *keypaths = [self zy_observableKeypaths];
    for (NSString *keypath in keypaths) {
        [self addObserver:self forKeyPath:keypath options:[self observerOptionsForKeypath:keypath] context:NULL];
    }
}
-(void) zy_unregisterFromKVO {
    NSArray *keypaths = [self zy_observableKeypaths];
    for (NSString *keypath in keypaths) {
        [self removeObserver:self forKeyPath:keypath];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(zy_changeForKeypath:) withObject:keyPath waitUntilDone:NO];
    } else {
        [self zy_changeForKeypath:keyPath];
    }
}

-(NSArray*) zy_observableKeypaths {
    return nil;
}

-(void) zy_changeForKeypath:(NSString*) keypath {}


#pragma mark IQWRouterViewController
-(id)initWithURL:(NSString *)URL routerParams:(NSDictionary *)params {
    self.routerParams = params;
    self = [super init];
    if (self) {
        if (!_zyInitTag) {
            [self zy_vcInit];
            _zyInitTag = YES;
        }
    }
    return self;
}

#pragma mark IQWRouterViewControllerDelegate
-(void) viewController:(UIViewController*) viewController routerParams:(NSDictionary*) params {
    [_routerDelegate viewController:viewController routerParams:params];
}

@end
