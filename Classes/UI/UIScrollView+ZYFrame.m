//
//  UIScrollView+ZYFrame.m
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 15/12/16.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "UIScrollView+ZYFrame.h"

@implementation UIScrollView (ZYFrame)

-(CGFloat)zy_contnetWidth {
    return self.contentSize.width;
}

-(void)setzy_contnetWidth:(CGFloat)zy_contnetWidth {
    if (self.contentSize.width == zy_contnetWidth) return;
    self.contentSize = CGSizeMake(zy_contnetWidth, self.contentSize.height);
}

-(CGFloat)zy_contentHeight {
    return self.contentSize.height;
}

-(void)setzy_contentHeight:(CGFloat)zy_contentHeight {
    if (self.contentSize.height == zy_contentHeight) return;
    self.contentSize = CGSizeMake(self.contentSize.width, zy_contentHeight);
}

-(CGFloat)zy_contentOffsetX {
    return self.contentOffset.x;
}

-(void)setzy_contentOffsetX:(CGFloat)zy_contentOffsetX {
    if (self.contentOffset.x == zy_contentOffsetX) return;
    self.contentOffset = CGPointMake(zy_contentOffsetX, self.contentOffset.y);
}

-(CGFloat)zy_contentOffsetY {
    return self.contentOffset.y;
}

-(void)setzy_contentOffsetY:(CGFloat)zy_contentOffsetY {
    if (self.contentOffset.y == zy_contentOffsetY) return;
    self.contentOffset = CGPointMake(self.contentOffset.x, zy_contentOffsetY);
}

-(CGFloat)zy_contentInsetTop {
    return self.contentInset.top;
}

-(void)setzy_contentInsetTop:(CGFloat)zy_contentInsetTop {
    if (self.contentInset.top == zy_contentInsetTop) return;
    self.contentInset = UIEdgeInsetsMake(zy_contentInsetTop, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat)zy_contentInsetBottom {
    return self.contentInset.bottom;
}

-(void)setzy_contentInsetBottom:(CGFloat)zy_contentInsetBottom {
    if (self.contentInset.bottom == zy_contentInsetBottom) return;
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, zy_contentInsetBottom, self.contentInset.right);
}

-(CGFloat)zy_contentInsetLeft {
    return self.contentInset.left;
}

-(void)setzy_contentInsetLeft:(CGFloat)zy_contentInsetLeft {
    if (self.contentInset.left == zy_contentInsetLeft) return;
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, zy_contentInsetLeft, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat)zy_contentInsetRight {
    return self.contentInset.right;
}

-(void)setzy_contentInsetRight:(CGFloat)zy_contentInsetRight {
    if (self.contentInset.right == zy_contentInsetRight) return;
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom, zy_contentInsetRight);
}


@end
