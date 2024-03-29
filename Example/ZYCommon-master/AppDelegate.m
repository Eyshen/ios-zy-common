//
//  AppDelegate.m
//
//     _______________      __
//    /\______   /  \ \    / /
//    \/___  /  /    \ \  / /
//        / /  /      \ \/ /
//       / /  /        \/ /
//      / /  /______   / /
//     / /__________\ / /
//    /_____________/ \/
//  Created by Eason.zhangyi on 15/11/18.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "AppDelegate.h"
#import "Gender.h"
#import "CocoaLumberjack.h"
#import "RootViewController.h"
#import "BaseZYNavigationController.h"
#import "UIDevice+ZYExtension.h"
#import "ZYVersionUtils.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    NSString *version = @"8.-1.bate";
    
    if ([ZYVersionUtils currentSystemVersionGreaterThan:version]) {
        NSLog(@"%@ > %@",[UIDevice osVersion], version);
    } else {
        NSLog(@"%@ <= %@",[UIDevice osVersion], version);
    }
    
//    NSLog(@"CURRENT VERSION:%@",[UIDevice osVersion]);
//    if (ZY_OS_VERSION_LESS_THAN(version)) {
//        NSLog(@"%@ < %@",osVersion, version);
//    } else {
//        NSLog(@"%@ >= %@",osVersion, version);
//    }
//    
//    if (ZY_OS_VERSION_GREATER_THAN(version)) {
//        NSLog(@"%@ > %@",osVersion, version);
//    } else {
//        NSLog(@"%@ <= %@",osVersion, version);
//    }
    
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    [self.window setRootViewController:[BaseZYNavigationController zy_instance:[RootViewController zy_instance]]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
