//
//  BNRItemStore.m
//  HomePwner
//
//  Created by John Gallagher on 1/7/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

/**
 这是一个单例对象,每个应用都只会有一个这种类型的对象.
 如果尝试创建另一个对象,他就会返回已经创建的那个对象.
 当程序要在不同的代码段使用同一个对象的时候,将这个对象
 设置为单例对象很方便,这要向该对象的类发送特定的方法就可以得到这个对象...
 */
@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    
    //这段代码将sharedStore声明为静态变量(static variable),当某个定义了静态变量的方法返回时,程序并不会立刻//
    //释放相应的变量.静态变量和全局变量(global variable)一样,并不是保存在栈中的.//
    static BNRItemStore *sharedStore;

    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }

    return sharedStore;
}

// If a programmer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

/**
 这是一种常见的设计模式,用于限制内部数据的访问权限.某个对象有一种可修改的数据
 但是除了该对象外其他对象都只能访问该数据而不能修改它.

 @return <#return value description#>
 */
- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];

    [self.privateItems addObject:item];

    return item;
}

@end
