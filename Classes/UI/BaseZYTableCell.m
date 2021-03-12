//
//  BaseZYTableCell.m
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//
//  Created by Eason.zhangyi on 15/7/29.
//  Copyright (c) 2016年 ZY. All rights reserved.
//

#import "BaseZYTableCell.h"

@interface BaseZYTableCell ()
@property (nonatomic, assign) BOOL zyInitTag;
@end
@implementation BaseZYTableCell

#pragma mark KVO
-(NSKeyValueObservingOptions) zy_observerOptionsForKeypath:(NSString*) keyPath {
    return NSKeyValueObservingOptionNew;
}

- (void) zy_registerForKVO {
	for (NSString *keyPath in [self zy_observableKeypaths]) {
		[self addObserver:self forKeyPath:keyPath options:[self zy_observerOptionsForKeypath:keyPath] context:NULL];
	}
}

- (void) zy_unregisterFromKVO {
	for (NSString *keyPath in [self zy_observableKeypaths]) {
		[self removeObserver:self forKeyPath:keyPath];
	}
}

- (NSArray *) zy_observableKeypaths {
	return nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if (![NSThread isMainThread]) {
		[self performSelectorOnMainThread:@selector(zy_changeForKeypath:) withObject:keyPath waitUntilDone:NO];
	} else {
		[self zy_changeForKeypath:keyPath];
	}
}

- (void)zy_changeForKeypath:(NSString *)keyPath {}

-(void)dealloc {
    [self zy_unregisterFromKVO];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) loadBaseZYTableCellSubviews {
    if (!_zyInitTag) {
        [self zy_registerForKVO];
        _zyInitTag = YES;
    }
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)view).delaysContentTouches = NO;
            break;
        }
    }
    
    [self zy_loadSubViews];
}

-(void) zy_loadSubViews {
    if (self.contentView) {
        [self.contentView setUserInteractionEnabled:YES];
        [self setUserInteractionEnabled:YES];
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadBaseZYTableCellSubviews];
    }
    return self;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadBaseZYTableCellSubviews];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadBaseZYTableCellSubviews];
    }
    return self;
}
-(id)init {
    self = [super init];
    if (self) {
        [self loadBaseZYTableCellSubviews];
    }
    return self;
}
-(void)prepareForReuse {
    [super prepareForReuse];
    [self zy_reuseTableCell];
}

-(void) zy_reuseTableCell {
}

+(instancetype) zy_instance {
    BaseZYTableCell *instance = nil;
    @try {
        NSString *className = NSStringFromClass(self);
        NSString *nibFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.nib",className]];
        NSString *iphoneNibFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@~iphone.nib",className]];
        NSString *ipadNibFile = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@~ipad.nib",className]];
        NSFileManager *fm = [NSFileManager defaultManager];
        if ([fm fileExistsAtPath:iphoneNibFile] || [fm fileExistsAtPath:nibFile] || [fm fileExistsAtPath:ipadNibFile]) {
            id o = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
            if ([o isKindOfClass:self]) {
                instance = o;
            }
        }
        if (!instance) {
            instance = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self zy_tableCellIdentifier]];
        }
    }
    @catch (NSException *exception) {
        instance = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self zy_tableCellIdentifier]];
    }
    return instance;
}

+(NSString*) zy_tableCellIdentifier {
    return [[NSString alloc] initWithFormat:@"%@Identifier",NSStringFromClass(self)];
}

+(CGFloat) zy_getDefaultRowHeight:(id)info {
    return 44.0f;
}
@end
