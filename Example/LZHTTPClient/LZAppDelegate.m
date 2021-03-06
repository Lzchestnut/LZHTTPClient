//
//  LZAppDelegate.m
//  LZHTTPClient
//
//  Created by kk on 02/07/2020.
//  Copyright (c) 2020 kk. All rights reserved.
//

#import "LZAppDelegate.h"
#import <LZNetworkingManager.h>

@implementation LZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self configNetworking];
    return YES;
}

- (void)configNetworking {
    LZNetworkingConfig *networkingConfig = [LZNetworkingConfig networkingConfigWithBasePath:@""];
    //以下均可灵活配置
    LZErrorConfig *errorConfig = [LZErrorConfig errorConfigWithNetworkingErrorPrompt:^(NSError *error, UIViewController *controller) {
       //TODO:网络错误
    } dataErrorPrompt:^void(id responseObject, UIViewController *controller) {
       //TODO:数据错误
    }];
    
    //创建加载处理配置对象，处理加载过程
    LZLoadConfig *loadConfig = [LZLoadConfig loadConfigWithLoadBegin:^(UIViewController *controller){
        
    } loadEnd:^(UIViewController *controller){
    
    }];
    
    //配置网络框架成功标识
    [LZNetworkingManager configWithNetworkingConfig:networkingConfig errorConfig:errorConfig loadConfig:loadConfig condictionOfSuccess:^BOOL(id responseObject) {
        return [responseObject[@"status"] integerValue] == 1;
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
