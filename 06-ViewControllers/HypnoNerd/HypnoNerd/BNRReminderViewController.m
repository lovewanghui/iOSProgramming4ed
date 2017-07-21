//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Reminder";
    
        // Create a UIImage from a file
        // This will use Time@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Time.png"];

        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }

    return self;
}

/**
 当某个ViewController的view有两个子或者两个以上的子视图时,使用InterfaceBiulder创建视图的层级结构会方便很多
 当视图控制器从NIB文件中创建视图层次结构的时候,不需要覆盖loadView方法,默认的loadView方法会自动处理NIB文件中包含的
 视图层次结构.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"BNRReminderViewController loaded its view");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);

    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;

    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
