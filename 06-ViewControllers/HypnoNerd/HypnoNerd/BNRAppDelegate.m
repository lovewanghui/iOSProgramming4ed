//
//  BNRAppDelegate.m
//  HypnoNerd
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisViewController.h"
#import "BNRReminderViewController.h"

@implementation BNRAppDelegate

/**
 视图控制器的初始化方法:::
 
 先init——>但是init会调用initWithNibName:bundle: 来创建视图控制器,这是由于initWithNibName:bundle:是ViewController的指定初始化方法.
 
 向试图控制器对象发送init消息,会自动调用initWithNibName:bundle: 并为两个参数都传入nil.
 
 虽然两个参数都为nil,但是UIViewController对象仍然会在应用程序包中查找和当前UIViewController子类同名的XIB文件.  所以,建议UIViewController子类和盖子类需要载入的XI
 件取相同的名称,这样当试图控制器需要加载视图的时候,会自动载入正确的XIB文件.

 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.


    BNRHypnosisViewController *hvc = [[BNRHypnosisViewController alloc] init];

    // Look in the appBundle for the file BNRReminderViewController.xib
    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] init];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[hvc, rvc];

    self.window.rootViewController = tabBarController;
    //将tabBarViewController设置为UIWindow对象的rootViewController,此刻UIWindow对象会将该视图控制器的view作为子视图加入窗口.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
