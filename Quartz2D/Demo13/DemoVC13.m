//
//  DemoVC13.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/25.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC13.h"

@interface DemoVC13 ()

@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation DemoVC13

-(void)loadView{
    UIImageView *imageVIew = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageVIew.image = [UIImage imageNamed:@"2B.jpg"];
    self.view = imageVIew;
    self.view.userInteractionEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:@"2A.jpg"];
    [self.view addSubview:self.imageView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    
    //获取当前点
    CGPoint curP = [pan locationInView:self.view];
    //获取擦除的矩形范围
    CGFloat wh = 50;
    CGFloat x = curP.x - wh * 0.5;
    CGFloat y = curP.y - wh * 0.5;
    CGRect rect = CGRectMake(x, y, wh, wh);
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //控件的layer渲染上去
    [_imageView.layer renderInContext:ctx];
    
    //擦除图片
    CGContextClearRect(ctx, rect);
    
    
    //生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    _imageView.image = image;
    //关闭上下文
    UIGraphicsEndImageContext();
}


@end
