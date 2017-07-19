//
//  BNRAppDelegate.m
//  Quiz
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRQuizViewController.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    BNRQuizViewController *quizVC = [[BNRQuizViewController alloc] init];
    /*
     控制器的初始化方法(两种方法可供选择)
     
     1.init 方法
     2.initWithNibName:bundle:方法
     
     你可以直接调用init方法,但是调用此方法也就相当于间接调用initWithNibName:bundle: 只不过在传入参数的额时候,会把NibName和Bundle都设为nil.
     本质上是一个方法,你也可以直接调用,initWithNibName:bundle 直接传入nil参数,也可以初始化控制器.
     那么向一个需要使用nib文件的视图控制器发送init消息会发生什么情况?
     事实上,这并不耽误事,你会发现没有什么变化,当init 调用initWithNibName:bundle方法,虽然传入的两个参数都为nil,但是UIViewController仍然会载入同名的XIB文件,这就是为什么要取同样的名字,这是一种约定俗称的规范,这样当控制器需要加载视图的时候,会自动载入同名的XIB文件.
     */
    self.window.rootViewController = quizVC;
    //UIWindow类里面有属性---@property(nullable, nonatomic,strong) UIViewController *rootViewController
    // default is nil


    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    //思考一个问题:关于UIViewController 中的loadView 什么时候会调用???
/**
 张志远是个大傻逼...

 */
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
