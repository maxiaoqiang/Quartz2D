//
//  DemoVC9.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/24.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC9.h"
#import "UIImage+Addition.h"

@interface DemoVC9() 
@property (nonatomic, strong) UIImageView *imageView;

@end
@implementation DemoVC9

-(void)viewDidLoad{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    _imageView = imageView;
  
    //带边圈的
    UIImage *image = [UIImage imageWithClipImage:[UIImage imageNamed:@"阿狸头像"] borderWidth:1 borderColor:[UIColor purpleColor]];
    _imageView.image = image;
    
}

-(void)clipImage{
    //0、加载图片
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    //1、开启位图上下文，、跟图片尺寸一样大
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2、设置圆形裁剪区域，正切与图片
    //2.1、创建圆形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.width)];
    //2.2把路径设置为裁剪区域
    [path addClip];
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    //4、从上下文中获取图片
    UIImage *cliImage = UIGraphicsGetImageFromCurrentImageContext();
    //5、关闭上下文
    UIGraphicsEndImageContext();
    _imageView.image = cliImage;
}


@end
