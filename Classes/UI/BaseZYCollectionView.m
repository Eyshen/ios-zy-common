//
//  BaseZYCollectionView.m
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


#import "BaseZYCollectionView.h"

@interface BaseZYCollectionView ()
@property (nonatomic, assign) BOOL initTag;
@end

@implementation BaseZYCollectionView

#pragma mark Observer tableView contentSize
-(void) addContentSizeChangeKVO {
    [self addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentSize"]) {
        [_pullRefreshFooterView refreshContentSize];
    }
}

-(void) removeContentSizeKVO {
    [self removeObserver:self forKeyPath:@"contentSize"];
}

-(void) zyTableInit {
    if (!_initTag) {
        
        self.canCancelContentTouches = YES;
        
        UIView *wrapView = self.subviews.firstObject;
        if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
            for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
                if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                    gesture.enabled = NO;
                    break;
                }
            }
        }
        
        self.delaysContentTouches = NO;
        [self addContentSizeChangeKVO];
        _initTag = YES;
    }
}


-(void)dealloc {
    [self removeContentSizeKVO];
}

-(instancetype)init {
    self = [super init];
    if (self) {
        [self zyTableInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self zyTableInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self zyTableInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self zyTableInit];
    }
    return self;
}

@end
