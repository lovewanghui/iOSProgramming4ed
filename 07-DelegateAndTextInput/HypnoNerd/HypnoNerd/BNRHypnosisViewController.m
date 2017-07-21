//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
//设置UITextField的委托对象为self,这样就可以向委托对象发送消息,同时声明委托对象遵守协议

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

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
    }

    return self;
}

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];

    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];

    // Setting the border style on the text field will allow us to see it easier
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    [backgroundView addSubview:textField];

    textField.delegate = self;
    //把文本框的delegate设置为自身控制器.
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];

    NSLog(@"BNRHypnosisViewController loaded its view");
}

/**
 
 当按Return键的时候,调用此方法.
 UITextField对象有一些列的属性,用于设置弹出的键盘.
 设计模式:目标-动作设计模式,委托设计模式.
 在目标-动作设计模式中,需要创建不同的动作消息.
 
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];

    textField.text = @"";//设置...textField.text为@" ".
    [textField resignFirstResponder];//注销第一响应者

    return YES;
}


/**
    UITExtField对象有一个委托属性,通过为UITextField对象设置委托,UITextField对象会在发生时间时向委托发送相应的消息.
    由委托处理该时间
    UIResponder定义了一些列的方法,用于接收和处理用户事件,例如:
     1. 触摸事件
     2. 运动事件(例如摇晃,翻转设备)
     3. 功能控制事件(编辑文本和播放音乐)
    UIResponder的子类会覆盖这些方法,实现自己的事件响应代码.
    其他类型(除触摸事件)则会由第一响应者负责处理(firstRespender).UIWindow 由一个firstResponder的属性
    当用户点击UITextField的时候,UIWindow就会将firstResponder指向UITextField.之后如果接收到运动事件
    和功能控制事件,都会发送给UITextField对象.
    实际上大部分视图都不需要称为第一响应者.例如UISlider对象,该对象只处理触摸事件,而不会接受其他类型的事件,因此
    它不要称为第一响应者.
 
 */
- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];

        // Configure the label's colors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;

        // This method resizes the label, which will be relative
        // to the text that it is displaying
        [messageLabel sizeToFit];

        // Get a random x value that fits within the hypnosis view's width
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random_uniform(width);

        // Get a random y value that fits within the hypnosis view's height
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random_uniform(height);

        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;

        // Add the label to the hierarchy
        [self.view addSubview:messageLabel];

        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];

        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
    }
}

@end
