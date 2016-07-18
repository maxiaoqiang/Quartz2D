//
//  DemoVC15.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/27.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC15.h"

@interface DemoVC15 ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation DemoVC15

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    _imageView.image = [UIImage imageNamed:@"火影"];
    [self.view addSubview:_imageView];
    
    
    [self viewLayer];
    [self imageLayer];
   
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //图层形变
    //缩放
    [UIView animateWithDuration:1 animations:^{
        
        _redView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
//        _redView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
//        //快速进行图层缩放KVC
//        //x,y同时缩放0.5
//        [_redView.layer setValue:@0.5 forKeyPath:@"transform.scale"];
//        [_redView.layer setValue:@(M_PI) forKeyPath:@"transform.rotation"];
    }];
}


-(void)imageLayer{
    //cornerRadius设置控件的主层边框
    _imageView.layer.cornerRadius = 50;
    //    NSLog(@"%@",_imageView.layer.contents);
    //超出主层边框的内容全部裁剪掉
    _imageView.layer.masksToBounds = YES;
    //设置边框
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imageView.layer.borderWidth = 1;
    //如何判断以后是否需要裁剪图片，就判断下需要显示图层的控件是否是正方形
}


-(void)viewLayer{
    //设置阴影
    _redView.layer.shadowOpacity = 1;
    //    _redView.layer.shadowOffset = CGSizeMake(10, 10);
    //注意:图层的颜色都是核心绘图框架，通常，CGColor
    _redView.layer.shadowColor = [UIColor yellowColor].CGColor;
    _redView.layer.shadowRadius = 10;
    
    //圆角半径
    _redView.layer.cornerRadius = 50;
    
    //边框
    _redView.layer.borderWidth = 1;
    _redView.layer.borderColor = [UIColor whiteColor].CGColor;
}


@end
