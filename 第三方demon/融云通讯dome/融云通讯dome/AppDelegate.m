//
//  AppDelegate.m
//  融云通讯dome
//
//  Created by 郭鹏 on 16/4/22.
//  Copyright © 2016年 郭鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [[RCIM sharedRCIM]initWithAppKey:@"c9kqb3rdkgr8j"];
    [[RCIM sharedRCIM] connectWithToken:@"KS/+k6DEWtkSb8QoBXYdXiP1zaTmjBRfxDPVnVGRtvWgnqBZljXEzSbqwP996fVQVOEvAzyp9DE87jbSXxsFoQ==" success:^(NSString *userId) {
       dispatch_async(dispatch_get_main_queue(), ^{
           self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
           self.window.backgroundColor=[UIColor whiteColor];
           [self.window makeKeyAndVisible];
           RCConversationViewController *chat=[[RCConversationViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"test2"];
           chat.title = @"talk something";
           self.window.rootViewController=chat;
       });
        
    } error:^(RCConnectErrorCode status) {
        
    } tokenIncorrect:^{
        
    }];
    
//   ViewController *vc=[[ViewController alloc]init];
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
//    
    
    
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
