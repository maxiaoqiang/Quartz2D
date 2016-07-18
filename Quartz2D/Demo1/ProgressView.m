//
//  ProgressView.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/23.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    //重绘，系统会先创建与view相关联的上下文，然后再调用drawRect
    [self setNeedsDisplay];
}

//注意：drawRect不能手动调用，因为图形上下文我们自己创建不了，只能有系统帮我们创建，并且传递给我们
-(void)drawRect:(CGRect)rect{
    //创建贝瑟尔路径
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat endA = -M_PI_2 + _progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 2 startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    [path stroke];
    
    
    CGFloat endB = M_PI_2 + _progress * M_PI * 2;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 10 startAngle:M_PI_2 endAngle:endB clockwise:YES];
    [path1 stroke];
}


@end
