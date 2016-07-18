//
//  StackView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "StackView.h"

@implementation StackView

-(void)drawRect:(CGRect)rect{
    //1、获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //将ctx拷贝一份放到栈中
    CGContextSaveGState(ctx);
    //2、拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //第一根线
    [path moveToPoint:CGPointMake(10, 125)];
    [path addLineToPoint:CGPointMake(240, 125)];
    
    //设置绘图状态
    [[UIColor redColor] set];
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //容易遗漏
    CGContextAddPath(ctx, path.CGPath);
    //渲染:(注意渲染的时候，一定要将路径添加到上下文，每次渲染之前查看一下，有没有把路径添加到上下文)
    CGContextStrokePath(ctx);
    
    
    //从栈顶的上下文出栈，替换当前上下文
    CGContextRestoreGState(ctx);
    //第二根线
    //这个候补，解决画三根线的问题
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(125, 10)];
    [path addLineToPoint:CGPointMake(125, 240)];
    //将路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //渲染
    CGContextStrokePath(ctx);
    
    
}

@end
