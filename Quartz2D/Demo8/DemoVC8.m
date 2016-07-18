//
//  DemoVC8.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/24.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC8.h"

@interface DemoVC8()

@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation DemoVC8

-(void)viewDidLoad{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    _imageView = imageView;
    
//    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
//
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//    
//    //===================== 线一 =========================
//    //1、获取上下文(位图上下文)
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //2、描述路径
//    CGContextMoveToPoint(ctx, 50, 50);
//    CGContextAddLineToPoint(ctx, 200, 200);
//    [[UIColor redColor] set];
//    //渲染上下文
//    CGContextStrokePath(ctx);
//    //====================== 圆二========================
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
//    [[UIColor redColor]set];
//    [path stroke];
//    
//    //==============================================
//
//    UIImage *imageWater = UIGraphicsGetImageFromCurrentImageContext();
//    _imageView.image = imageWater;
    [self drawText];
}

#pragma mark--图片水印
-(void)drawText{
    
    
    //加载图片
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    
    //0、获取上下文，之前的上下文都是在view的drawRect方法中获取(跟View相关联的上下文layer上下文)
    // 目前我们需要绘制图片到新的图片上，因此需要用到位图上下文
    //怎么获取位图上下文，注意位图上下文的获取方式跟layer上下文不一样，位图上下文需要我们手动创建
    //开启一个位图上下文，注意位图上下文跟view无关联，所以不需要在drawRect
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
   
    //1、绘制原生的图片
    [image drawAtPoint:CGPointZero];
    //2、给原生的图片添加文字
    NSString *str = @"深圳泥巴装专用";
    //创建字典属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor purpleColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [str drawAtPoint:CGPointMake(100, 180) withAttributes:dict];
    
    //3、生成一张图片给我们，从上下文中获取图片
    UIImage *imageWater = UIGraphicsGetImageFromCurrentImageContext();
    //4、关闭上下文
    UIGraphicsEndImageContext();
    
    _imageView.image = imageWater;
}


@end
