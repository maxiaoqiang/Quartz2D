//
//  DemoVC14.m
//  Quartz2D
//
//  Created by 深圳市泥巴装网络科技有限公司 on 16/6/25.
//  Copyright © 2016年 马晓强. All rights reserved.
//

#import "DemoVC14.h"

@interface DemoVC14 ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIView *clipView;

@property (nonatomic, assign) CGPoint startP;


@end

@implementation DemoVC14

-(UIView *)clipView{
    if (_clipView == nil) {
        UIView *view = [[UIView alloc] init];
        _clipView = view;
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        [self.view addSubview:view];
    }
    return _clipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:@"火影"];
    [self.view addSubview:self.imageView];

    //给控制器view添加一个pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    
}

-(void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint endA = CGPointZero;
    if (pan.state == UIGestureRecognizerStateBegan) {//一开始拖动的地方
        //获取一开始触摸点
        _startP = [pan locationInView:self.view];
    }else if (pan.state == UIGestureRecognizerStateChanged){//一直拖懂
        //获取结束点
        endA = [pan locationInView:self.view];
        CGFloat w = endA.x - _startP.x;
        CGFloat h = endA.y -_startP.y;
        
        //获取截取范围
        CGRect clipRect = CGRectMake(_startP.x, _startP.y, w, h);
        //生成截屏的view
        self.clipView.frame = clipRect;
        
        
    }else if (pan.state == UIGestureRecognizerStateEnded){
    
        //图片裁剪，生成一张新的图片
        //开启上下文
        //如果不透明，默认超出裁剪区域会变成黑色，通常都是透明
        UIGraphicsBeginImageContextWithOptions(_imageView.bounds.size, NO, 0);
        //设置裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:_clipView.frame];
        [path addClip];
        //获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        //把控件上的内容渲染到上下文
        [_imageView.layer renderInContext:ctx];
        
        //生成一张新的图片
        _imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
        //先移除
        [_clipView removeFromSuperview];
        //截取的view设置为nil
        _clipView = nil;
        
    }
}



@end
