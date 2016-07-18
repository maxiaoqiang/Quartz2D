//
//  DrawLinePathView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DrawLinePathView.h"

@interface DrawLinePathView()
@property (nonatomic, strong) UIBezierPath *path;


@end

@implementation DrawLinePathView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    //touch
    UITouch *touch = [touches anyObject];
    //获取手指的触摸点
    CGPoint curP = [touch locationInView:self];
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    _path = path;
    //设置起点
    [path moveToPoint:curP];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    //获取手指触摸点
    CGPoint curP = [touch locationInView:self];
    [_path addLineToPoint:curP];
    [self setNeedsDisplay];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //给imageView添加核心动画
    //添加核心动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = _path.CGPath;
    anim.duration = 1;
    anim.repeatCount = MAXFLOAT;
    [[[self.subviews firstObject] layer] addAnimation:anim forKey:nil];
    
}

- (void)drawRect:(CGRect)rect {
    [_path stroke];
    
}


@end
