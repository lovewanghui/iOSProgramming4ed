//
//  main.m
//  Quiz
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNRAppDelegate.h"

/**
    几乎所有的程序都是由main函数开始执行的,iOS程序也不例外,但是main函数里面只执行一个函数.
    那就是UIAppplicationMain( , , , ),函数有四个参数分别代表不同的含义:
    这里需要注意的是UIApplication函数在这里都做了些什么???以及各个参数的含义
    1.
    2.
    3.
    ...
    设计概念:事件循环,runloop,创建代理对象.
 */
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([BNRAppDelegate class]));
    }
}
