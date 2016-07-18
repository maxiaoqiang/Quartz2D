//
//  RectView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "RectView.h"

@implementation RectView

-(void)drawRect:(CGRect)rect{
    //1、获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2、描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    //上下文矩阵操作
    //注意:矩阵操作必须在添加路径之前
    //平移
    CGContextTranslateCTM(ctx, 100, 50);
    //缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
    //旋转
    CGContextRotateCTM(ctx, M_PI_4);
    //3、把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor redColor] set];
    //4、渲染上下文
    CGContextFillPath(ctx);
}


@end
