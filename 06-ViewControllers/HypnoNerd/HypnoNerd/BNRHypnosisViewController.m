//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

/**
 你说说为什么在ViewController里面可以调用tabBarItem这个属性呢?
 但是,,,但是...在ViewController里面并没有这个属性...
 
 >>>已解决
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";

        // Create a UIImage from a file
        // This will use Hypno@2x on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];

        // Put that image on the tab bar item
        self.tabBarItem.image = image;
        //当ViewController被添加到UITabBarController里面是,才会有UITabBarItem
        NSLog(@"!!!%@",self);
    }

    return self;
}


- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];

    // Set it as *the* view of this view controller
    self.view = backgroundView;
    //在这里,为什么不需要重写super的loadView方法???
}

/**
 视图控制器不会在被创建的那一刻就马上创建并载入相应的视图,只有当应用需要将某个视图控制器的视图显示到屏幕上时,相应的试图控制器才会创建其视图.
 这种延迟加载视图的做法能提高内存的使用效率.
 视图控制器可以通过两种方式创建视图层次结构:
 1.代码方式:
 2.NIB文件方式:
 */
- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];

    NSLog(@"BNRHypnosisViewController loaded its view");
}

@end
