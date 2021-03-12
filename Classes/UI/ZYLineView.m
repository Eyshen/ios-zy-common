//
//  ZYLineView.m
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

#import "ZYLineView.h"

@implementation ZYLineView

-(void)zy_loadSubViews {
    [super zy_loadSubViews];
    [self setBackgroundColor:[UIColor clearColor]];
    _lineWidth = 1.0f / [[UIScreen mainScreen] scale];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapButt);
    
    if (_lineStyle == ZYLineStyleDotted) {
        CGFloat lenghts[] = {5, 5};
        CGContextSetLineDash(context, 0, lenghts, 2);
    }
    
    CGContextSetLineWidth(context, _lineWidth);
    if (!_lineColor) {
        _lineColor = [UIColor grayColor];
    }
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
    CGContextBeginPath(context);
    
    switch (_drawPosition) {
        case ZYLineDrawPositionVerticalCenter:
            CGContextMoveToPoint(context, (self.bounds.size.width-_lineWidth)/2.0f, 0);
            CGContextAddLineToPoint(context, (self.bounds.size.width-_lineWidth)/2.0f, self.bounds.size.height);
            break;
        case ZYLineDrawPositionHorizontalCenter:
            CGContextMoveToPoint(context, 0, (self.bounds.size.height-_lineWidth)/2.0f);
            CGContextAddLineToPoint(context, self.bounds.size.width, (self.bounds.size.height-_lineWidth)/2.0f);
            break;
        case ZYLineDrawPositionTop:
            CGContextMoveToPoint(context, 0, _lineWidth/2.0f);
            CGContextAddLineToPoint(context, self.bounds.size.width, _lineWidth/2.0f);
            break;
        case ZYLineDrawPositionLeft:
            CGContextMoveToPoint(context, _lineWidth/2.0f, 0);
            CGContextAddLineToPoint(context, _lineWidth/2.0f, self.bounds.size.height);
            break;
        case ZYLineDrawPositionRight:
            CGContextMoveToPoint(context, self.bounds.size.width-_lineWidth/2.0f, 0);
            CGContextAddLineToPoint(context, self.bounds.size.width-_lineWidth/2.0f, self.bounds.size.height);
            break;
        case ZYLineDrawPositionBottom:
            CGContextMoveToPoint(context, 0, self.bounds.size.height-_lineWidth/2.0f);
            CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height-_lineWidth/2.0f);
            break;
        default:
            break;
    }
    
    CGContextStrokePath(context);
}


-(void)setLineWidth:(CGFloat)lineWidth {
    if (_lineWidth == lineWidth) {
        return;
    }
    _lineWidth = MAX(0, lineWidth);
    [self setNeedsDisplay];
}

-(NSArray *)zy_observableKeypaths {
    return @[@"lineColor",@"drawPosition",@"lineWidth"];
}

-(void)zy_changeForKeypath:(NSString *)keyPath {
    [self setNeedsDisplay];
}

@end
