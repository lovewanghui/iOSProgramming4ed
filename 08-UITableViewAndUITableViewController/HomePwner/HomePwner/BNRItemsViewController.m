//
//  BNRItemsViewController.m
//  HomePwner
//
//  Created by John Gallagher on 1/7/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

/**
 两个凡是:
 凡是遵守UITableViewDateSource协议的对象,都可以成为UITableView对象的数据源
 (即dateSource 属性所指向的对象)
 凡是遵守UITableViewDelegate协议的对象,都可以成为UITableView对象的委托对象
 @property (nonatomic, weak, nullable) id <UITableViewDataSource> dataSource;
 @property (nonatomic, weak, nullable) id <UITableViewDelegate> delegate;
 UITableViewController可以承担以上所有的角色.
 
 */
@implementation BNRItemsViewController

/**
 当某个UITabelView要获取显示的数据时,会向其数据源发送一组特定的消息.
 这些消息都是在UITableViewDateScource协议中声明的.

 @return <#return value description#>
 */
- (instancetype)init
{
    
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    NSLog(@"sizeof(NSInteger) = %@", @(sizeof(NSInteger)));
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

/**
 当某个UITableView对象要显示表格内容时,会向自己的数据源发送一些列的消息,其中包括required 和 selected

 @param tableView self
 @param section 表格段:每个UITableView可以分段显示数据,每个表格段(section)代表一组独立的行,默认只有一个section,每一行都是一个独立的视图,这些视图就是cell.
 @return 返回一个整形值代表table的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}


/**
 获取用于显示第section个表格段,第row行数据的cell对象.
 这两个协议方法是必须要实现的...知道为什么吗??? 
 因为:它们中一个是显示::::
     另一个是....显示.... 
 你知道了吧...
 

 @param tableView <#tableView description#>
 @param indexPath 如何确定:cell中的数据和对应cell的关系? NSIndexPath对象!!!
 @return <#return value description#>
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];

    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];

    cell.textLabel.text = [item description];

    return cell;
}

@end
