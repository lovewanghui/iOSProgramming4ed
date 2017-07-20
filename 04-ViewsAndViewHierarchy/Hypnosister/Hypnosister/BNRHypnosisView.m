//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

/*
 该方法是UIView指定的初始化方法.
其中参数所涉及的机构如下:
 
 //Rectangles.
struct CGRect {
    CGPoint origin;
    CGSize size;
};
typedef struct CGRect CGRect;
 //Rectangle edges.

//Points.

struct CGPoint {
    CGFloat x;
    CGFloat y;
};
typedef struct CGPoint CGPoint;

//Sizes.

struct CGSize {
    CGFloat width;
    CGFloat height;
};
typedef struct CGSize CGSize;


 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//在这里,关于drawRect:方法不必过多的关心,只需要知道视图根据该方法将自己绘制到图层cayer上.注意frame和bounds

/**
 @property(nonatomic,readonly,strong)                 CALayer  *layer;              // returns view's layer. Will always return a non-nil value. view is layer's delegate
 
calayer和view的区别:
 
 1.首先UIView可以响应事件，Layer不可以.继承自不同的类导致的
 3.UIView主要是对显示内容的管理而 CALayer 主要侧重显示内容的绘制。
 每个 UIView 内部都有一个 CALayer 在背后提供内容的绘制和显示
 
 */
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;

    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    // The largest circle will circumstribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];

        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }

    // Configure line width to 10 points
    path.lineWidth = 10;

    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];

    // Draw the line!
    [path stroke];
}

@end
