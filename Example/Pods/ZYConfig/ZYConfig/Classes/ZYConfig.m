//
//  ZYConfig.m
//  ZYConfig-example
//
//  Created by 张一 on 17/4/6.
//  Copyright © 2017年 eason. All rights reserved.
//

#import "ZYConfig.h"

@interface ZYConfig ()

@property(nonatomic, copy) NSDictionary *configCache;

@end


@implementation ZYConfig

-(NSDictionary *)getConfig:(NSString *)configName {
    return [_configCache[configName] copy];
}

-(void)singleInit {
    //加载配置
    NSString *configFileName = [[NSBundle mainBundle] infoDictionary][@"ZYConfigFile"];
    //异步加载文件
    if (!configFileName) {
        configFileName = @"app-config";
    } else if ([configFileName hasSuffix:@".plist"]) {
        configFileName = [configFileName componentsSeparatedByString:@"."][0];
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:configFileName ofType:@"plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        @try {
            self.configCache = [[NSDictionary alloc] initWithContentsOfFile:path];
        } @catch (NSException *exception) {
            _configCache = nil;
        }
    } else {
        NSLog(@"config file not found ...");
    }
}

-(id)copy {
    return self;
}

-(id)mutableCopy {
    return self;
}

+(instancetype)sharedInstance {
    static dispatch_once_t once;
    static id s;
    dispatch_once( &once, ^{
        s = [[self alloc] init];
        if ([s respondsToSelector:@selector(singleInit)]) {
            [s singleInit];
        }
    });
    return s;
}

@end
